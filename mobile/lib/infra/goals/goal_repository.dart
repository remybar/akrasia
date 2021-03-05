import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:akrasia/domain/goals/i_goal_repository.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/infra/core/firestore_helpers.dart';
import 'package:akrasia/infra/goals/goal_dto.dart';

@LazySingleton(as: IGoalRepository)
class GoalRepository implements IGoalRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  GoalRepository();

  @override
  Future<Either<GoalFailure, Unit>> create(Goal goal) async {
    try {
      final userDoc = await _firestore.userDocument();
      final goalDTO = GoalDTO.fromDomain(goal);
      await userDoc.goalCollection.doc(goalDTO.id).set(goalDTO.toJson());
      return right(unit);
    } on FirebaseException {
      //TODO: to refine
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
    } on FirebaseException {
      //TODO: to refine (permission denied, not found, ...)
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
    } on FirebaseException {
      //TODO: to refine (permission denied, not found, ...)
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
      // if (e is FirebaseException) {
      //TODO: to improve + log(e.toString())
      return left(const GoalFailure.unexpected());
    });
  }

  @override
  Stream<Either<GoalFailure, KtList<Goal>>> watchAtDate(DateTime date) {
    // TODO: implement watchAtDate
    throw UnimplementedError();
  }
}
