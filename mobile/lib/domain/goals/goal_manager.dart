// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:akrasia/domain/goals/i_goal_repository.dart';
import 'package:meta/meta.dart';
import 'i_goal_manager.dart';

/// The goal manager links the application and the domain layers
@LazySingleton(as: IGoalManager)
class GoalManager implements IGoalManager {
  final IGoalRepository _repository;

  GoalManager(this._repository);

  @override
  Stream<Either<GoalFailure, KtList<GoalStep>>> watchAll({@required DateTime fromDate}) {
    return _repository.watchAll(fromDate: fromDate);
  }

  @override
  Future<Either<GoalFailure, Unit>> create({@required Goal goal}) async {
    // first, create the goal
    final result = await _repository.create(goal: goal);

    return result.fold((failure) => left(failure), (_) async {
      // then, add the first step if the goal starts today
      if (goal.startDate.getOrCrash().isBefore(DateTime.now())) {
        return _repository.createStep(step: goal.createStep());
      }
      return right(unit);
    });
  }

  // update the goal without changing any steps as goal modification
  // will be applied from the next steps
  @override
  Future<Either<GoalFailure, Unit>> update({@required Goal goal}) async {
    return _repository.update(goal: goal);
  }

  @override
  Future<Either<GoalFailure, Unit>> delete({@required UniqueId goalId}) {
    return _repository.delete(goalId: goalId);
  }

  @override
  Future<Either<GoalFailure, Unit>> updateStep({@required GoalStep step}) {
    return _repository.updateStep(step: step);
  }
}
