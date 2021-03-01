import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';

abstract class IGoalRepository {
  Stream<Either<GoalFailure, KtList<Goal>>> watchAll();
  Stream<Either<GoalFailure, KtList<Goal>>> watchAtDate(DateTime date);

  Future<Either<GoalFailure, Unit>> create(Goal goal);
  Future<Either<GoalFailure, Unit>> update(Goal goal);
  Future<Either<GoalFailure, Unit>> delete(Goal goal);
}
