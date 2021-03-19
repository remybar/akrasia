// Package imports:
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';

/// Goal repository to manipulate goals (CRUD)
abstract class IGoalRepository {
  Stream<Either<GoalFailure, KtList<Goal>>> watchAll();

  Future<Either<GoalFailure, Unit>> create(Goal goal);
  Future<Either<GoalFailure, Unit>> update(Goal goal);
  Future<Either<GoalFailure, Unit>> delete(Goal goal);
}
