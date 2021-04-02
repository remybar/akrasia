// Package imports:
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:meta/meta.dart';

// Provide an access to goals, steps, data to the application layer
abstract class IGoalManager {
  // Get a stream of goal step at a specific date [fromDate]
  Stream<Either<GoalFailure, KtList<GoalStep>>> watchAll({@required DateTime fromDate});

  // create a new goal
  Future<Either<GoalFailure, Unit>> create({@required Goal goal});

  // update an existing goal
  Future<Either<GoalFailure, Unit>> update({@required Goal goal});

  // remove an existing goal
  Future<Either<GoalFailure, Unit>> delete({@required UniqueId goalId});

  Future<Either<GoalFailure, Unit>> updateStep({@required GoalStep step});
}
