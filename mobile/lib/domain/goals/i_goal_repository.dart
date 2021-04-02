// Package imports:
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:meta/meta.dart';

/// Goal repository to manipulate goals (CRUD)
abstract class IGoalRepository {
  Stream<Either<GoalFailure, KtList<GoalStep>>> watchAll({@required DateTime fromDate});

  Future<Either<GoalFailure, Unit>> create({@required Goal goal});
  Future<Either<GoalFailure, Unit>> update({@required Goal goal});
  Future<Either<GoalFailure, Unit>> delete({@required UniqueId goalId});

  Future<Either<GoalFailure, Unit>> createStep({@required GoalStep step});
  Future<Either<GoalFailure, Unit>> updateStep({@required GoalStep step});
}
