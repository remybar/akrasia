// Package imports:
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/core/misc/log.dart';
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:akrasia/domain/goals/i_goal_repository.dart';
import 'package:akrasia/infra/core/firestore_helpers.dart';
import 'package:akrasia/infra/goals/dtos/goal_dto.dart';
import 'package:akrasia/infra/goals/dtos/goal_step_dto.dart';
import 'package:meta/meta.dart';

///
/// Management of the goal repository
///
@LazySingleton(as: IGoalRepository)
class GoalRepository implements IGoalRepository {
  /// access to the firebase database
  final FirebaseFirestore _firestore;
  final _stepsController = StreamController<Either<GoalFailure, KtList<GoalStep>>>.broadcast();

  StreamSubscription<List<GoalStepDTO>> _stepStreamSubscription;

  GoalRepository(this._firestore);

  Future<void> dispose() async {
    _stepStreamSubscription?.cancel();
    _stepsController.close();
  }

  /// Return the user steps collection name.
  /// Note: to be able to parse all steps for a single user,
  /// the steps collection name must be unique for each user.
  String _stepCollectionName(String uid) {
    return "${uid}_steps";
  }

  // ignore: avoid_void_async
  void _onGoalStepUpdate(List<GoalStepDTO> goalStepsDTO) async {
    final userDoc = await _firestore.userDocument();
    final Map<UniqueId, Goal> goals = await userDoc.goals.get().then(
      (snapshot) {
        final steps = snapshot.docs.map<Goal>(
          (doc) => GoalDTO.fromFirestore(doc).toDomain(),
        );
        return {for (var s in steps) s.id: s};
      },
    );

    // convert the goal steps DTO to goal step by reading parent goal info
    final steps = goalStepsDTO
        .map(
          (stepDTO) => stepDTO.toDomain(
            goals[stepDTO.goalId],
          ),
        )
        .toImmutableList();

    _stepsController.sink.add(right(steps));
  }

  @override
  Stream<Either<GoalFailure, KtList<GoalStep>>> watchAll({@required DateTime fromDate}) async* {
    final uid = await _firestore.uid();

    // stop previous stream subscriptions
    _stepStreamSubscription?.cancel();

    // listen for goal steps updates
    _stepStreamSubscription = _firestore
        .collectionGroup(_stepCollectionName(uid))
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => GoalStepDTO.fromFirestore(doc),
              )
              .toList(),
        )
        .listen(_onGoalStepUpdate);

    yield* _stepsController.stream;
  }

  /// create a new goal
  @override
  Future<Either<GoalFailure, Unit>> create({@required Goal goal}) async {
    // TODO: improve management error
    if (!goal.isValid()) {
      getLogger('infra').e('create::invalid goal');
      return left(const GoalFailure.invalidGoal());
    }

    // TODO: create the first step

    try {
      final userDoc = await _firestore.userDocument();
      final goalDTO = GoalDTO.fromDomain(goal);
      await userDoc.goals.doc(goalDTO.id).set(goalDTO.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      getLogger('infra').e('create::firebase exception :: ${e.code} :: ${e.message}');
      return left(const GoalFailure.unexpected());
    }
  }

  /// update a goal
  @override
  Future<Either<GoalFailure, Unit>> update({@required Goal goal}) async {
    // TODO: improve management error
    if (!goal.isValid()) {
      getLogger('infra').e('update::invalid goal');
      return left(const GoalFailure.invalidGoal());
    }

    try {
      final userDoc = await _firestore.userDocument();
      final goalDTO = GoalDTO.fromDomain(goal);
      await userDoc.goals.doc(goalDTO.id).update(goalDTO.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      getLogger('infra').e('update::firebase exception :: ${e.code} :: ${e.message}');
      return left(const GoalFailure.unexpected());
    }
  }

  /// delete a goal
  @override
  Future<Either<GoalFailure, Unit>> delete({@required UniqueId goalId}) async {
    // TODO: improve management error
    if (!goalId.isValid()) {
      getLogger('infra').e('delete::invalid goal ID');
      return left(const GoalFailure.invalidGoalID());
    }

    try {
      final userDoc = await _firestore.userDocument();
      await userDoc.goals.doc(goalId.getOrCrash()).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      getLogger('infra').e('delete::firebase exception :: ${e.code} :: ${e.message}');
      return left(const GoalFailure.unexpected());
    }
  }

  @override
  Future<Either<GoalFailure, Unit>> createStep({@required GoalStep step}) async {
    try {
      final userDoc = await _firestore.userDocument();
      final uid = await _firestore.uid();
      final goalStepJson = GoalStepDTO.fromDomain(step).toJson();
      await userDoc.goals
          .doc(step.goal.id.getOrCrash())
          .collection(_stepCollectionName(uid))
          .doc(step.id.getOrCrash())
          .set(goalStepJson);
      return right(unit);
    } on FirebaseException catch (e) {
      getLogger('infra').e('firebase exception :: ${e.code} :: ${e.message}');
      return left(const GoalFailure.unexpected());
    }
  }

  @override
  Future<Either<GoalFailure, Unit>> updateStep({@required GoalStep step}) async {
    try {
      final uid = await _firestore.uid();
      final userDoc = await _firestore.userDocument();
      final steps = userDoc.goals.doc(step.goal.id.getOrCrash()).collection(_stepCollectionName(uid));
      steps.doc(step.id.getOrCrash()).update(GoalStepDTO.fromDomain(step).toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      getLogger('infra').e('firebase exception :: ${e.code} :: ${e.message}');
      return left(const GoalFailure.unexpected());
    }
  }
}
