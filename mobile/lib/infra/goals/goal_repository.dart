// Dart imports:
import 'dart:async';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

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

///
/// Management of the goal repository
///
@LazySingleton(as: IGoalRepository)
class GoalRepository implements IGoalRepository {
  /// access to the firebase database
  final FirebaseFirestore _firestore;

  GoalRepository(this._firestore);

  /// Return the user steps collection name.
  /// Note: to be able to parse all steps for a single user,
  /// the steps collection name must be unique for each user.
  String _stepCollectionName(String uid) {
    return "${uid}_steps";
  }

  // log a firebase exception
  void _logFirebaseException(String fctName, FirebaseException e) {
    getLogger('infra').e('$fctName::${e.code}::{e.toString()}');
  }

  // convert a firebase exception to a goal failure
  GoalFailure _exceptionToFailure(FirebaseException e) {
    //TODO: refine mapping
    return const GoalFailure.unexpected();
  }

  // Listen to steps update and return a stream with a list of goal states at a specific [fromDate],
  // where a goal state is a goal and an optional step.
  @override
  Stream<Either<GoalFailure, KtPair<DateTime, Map<UniqueId, GoalStep>>>> watchSteps(DateTime fromDate) async* {
    try {
      final uid = await _firestore.uid();

      yield* _firestore.collectionGroup(_stepCollectionName(uid)).snapshots().map(
        (snapshot) {
          final steps = snapshot.docs
              .map(
                (doc) => GoalStepDTO.fromFirestore(doc).toDomain(),
              )
              .where(
                (step) => step.isActiveAtDate(fromDate),
              );
          return right(KtPair(fromDate, {for (var s in steps) s.goalId: s}));
        },
      );
    } on FirebaseException catch (e) {
      _logFirebaseException("watchSteps", e);
      yield left(_exceptionToFailure(e));
    }
  }

  ///
  @override
  Future<Either<GoalFailure, Map<UniqueId, Goal>>> getGoals({DateTime fromDate}) async {
    try {
      final userDoc = await _firestore.userDocument();

      return userDoc.goals.get().then(
        (snapshot) {
          final goals = snapshot.docs
              .map(
                (doc) => GoalDTO.fromFirestore(doc).toDomain(),
              )
              .where(
                (goal) => goal.isActiveAtDate(fromDate),
              );
          return right({for (var g in goals) g.id: g});
        },
      );
    } on FirebaseException catch (e) {
      _logFirebaseException("getGoals", e);
      return left(_exceptionToFailure(e));
    }
  }

  /// create a new goal
  @override
  Future<Either<GoalFailure, Unit>> create({@required Goal goal}) async {
    // sanity checks (shall never happen)
    if (!goal.isValid()) {
      getLogger('infra').e('create::invalid goal');
      return left(const GoalFailure.unexpected());
    }

    try {
      final userDoc = await _firestore.userDocument();
      final goalDTO = GoalDTO.fromDomain(goal);
      await userDoc.goals.doc(goalDTO.id).set(goalDTO.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      _logFirebaseException("create", e);
      return left(_exceptionToFailure(e));
    }
  }

  /// update a goal
  @override
  Future<Either<GoalFailure, Unit>> update({@required Goal goal}) async {
    // sanity checks (shall never happen)
    if (!goal.isValid()) {
      getLogger('infra').e('update::invalid goal');
      return left(const GoalFailure.unexpected());
    }

    try {
      final userDoc = await _firestore.userDocument();
      final goalDTO = GoalDTO.fromDomain(goal);
      await userDoc.goals.doc(goalDTO.id).update(goalDTO.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      _logFirebaseException("update", e);
      return left(_exceptionToFailure(e));
    }
  }

  /// delete a goal
  @override
  Future<Either<GoalFailure, Unit>> delete({@required UniqueId goalId}) async {
    // sanity checks (shall never happen)
    if (!goalId.isValid()) {
      getLogger('infra').e('delete::invalid goal ID');
      return left(const GoalFailure.unexpected());
    }

    try {
      final userDoc = await _firestore.userDocument();
      await userDoc.goals.doc(goalId.getOrCrash()).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      _logFirebaseException("delete", e);
      return left(_exceptionToFailure(e));
    }
  }

  @override
  Future<Either<GoalFailure, Unit>> createStep({@required GoalStep step}) async {
    try {
      final userDoc = await _firestore.userDocument();
      final uid = await _firestore.uid();
      final goalStepJson = GoalStepDTO.fromDomain(step).toJson();
      await userDoc.goals
          .doc(step.goalId.getOrCrash())
          .collection(_stepCollectionName(uid))
          .doc(step.id.getOrCrash())
          .set(goalStepJson);
      return right(unit);
    } on FirebaseException catch (e) {
      _logFirebaseException("createStep", e);
      return left(_exceptionToFailure(e));
    }
  }

  @override
  Future<Either<GoalFailure, Unit>> updateStep({@required GoalStep step}) async {
    try {
      final uid = await _firestore.uid();
      final userDoc = await _firestore.userDocument();
      final steps = userDoc.goals.doc(step.goalId.getOrCrash()).collection(_stepCollectionName(uid));
      steps.doc(step.id.getOrCrash()).update(GoalStepDTO.fromDomain(step).toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      _logFirebaseException("updateStep", e);
      return left(_exceptionToFailure(e));
    }
  }
}
