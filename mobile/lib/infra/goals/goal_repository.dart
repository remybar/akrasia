// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:akrasia/core/misc/log.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/i_goal_repository.dart';
import 'package:akrasia/infra/core/firestore_helpers.dart';
import 'package:akrasia/infra/goals/dtos/goal_dto.dart';

@LazySingleton(as: IGoalRepository)
class GoalRepository implements IGoalRepository {
  final FirebaseFirestore _firestore;

  GoalRepository(this._firestore);

  @override
  Future<Either<GoalFailure, Unit>> create(Goal goal) async {
    try {
      final userDoc = await _firestore.userDocument();
      final goalDTO = GoalDTO.fromDomain(goal);
      final goalJson = goalDTO.toJson();
      await userDoc.goalCollection.doc(goalDTO.id).set(goalJson);
      return right(unit);
    } on FirebaseException catch (e) {
      getLogger('infra').e('firebase exception :: ${e.code} :: ${e.message}');
      return left(const GoalFailure.unexpected());
    }
  }

  @override
  Future<Either<GoalFailure, Unit>> update(Goal goal) async {
    try {
      final userDoc = await _firestore.userDocument();
      final goalDTO = GoalDTO.fromDomain(goal);
      await userDoc.goalCollection.doc(goalDTO.id).update(goalDTO.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      getLogger('infra').e('firebase exception :: ${e.code} :: ${e.message}');
      return left(const GoalFailure.unexpected());
    }
  }

  @override
  Future<Either<GoalFailure, Unit>> delete(Goal goal) async {
    try {
      final userDoc = await _firestore.userDocument();
      final goalId = goal.id.getOrCrash();
      await userDoc.goalCollection.doc(goalId).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      getLogger('infra').e('firebase exception :: ${e.code} :: ${e.message}');
      return left(const GoalFailure.unexpected());
    }
  }

  @override
  Stream<Either<GoalFailure, KtList<Goal>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.goalCollection
        .snapshots()
        .map((snapshot) => right<GoalFailure, KtList<Goal>>(
              snapshot.docs
                  .map(
                    (doc) => GoalDTO.fromFirestore(doc).toDomain(),
                  )
                  .toImmutableList(),
            ))
        .onErrorReturnWith((e) {
      getLogger('infra').e('exception (e.runtimeType)');
      return left(const GoalFailure.unexpected());
    });
  }
}
