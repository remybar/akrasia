// Package imports:
import 'dart:async';

import 'package:akrasia/domain/goals/i_goal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/i_goal_manager.dart';
import 'goal.dart';
import 'goal_failure.dart';
import 'goal_state.dart';
import 'goal_step.dart';

@LazySingleton(as: IGoalManager)
class GoalManager implements IGoalManager {
  final IGoalRepository _repository;

  // controller to provide list of goal states to the application layer through a stream
  final stateStreamController = StreamController<Either<GoalFailure, KtList<GoalState>>>.broadcast();

  // stream subscription to be notified about goal steps update
  StreamSubscription<Either<GoalFailure, KtPair<DateTime, Map<UniqueId, GoalStep>>>> _stepStreamSubscription;

  GoalManager(this._repository);

  Future<void> dispose() async {
    _stepStreamSubscription?.cancel();
    stateStreamController.close();
  }

  // Handle goal steps update by building a list of goal states and add them to the state stream
  // ignore: avoid_void_async
  void _onGoalStepUpdate(Either<GoalFailure, KtPair<DateTime, Map<UniqueId, GoalStep>>> data) async {
    data.fold(
      (failure) => stateStreamController.sink.add(left(failure)),
      (data) async {
        final fromDate = data.first;
        final steps = data.second;

        // get the list of goals at the specific date
        final goals = await _repository.getGoals(fromDate: fromDate);

        goals.fold(
          (failure) => stateStreamController.sink.add(left(failure)),
          (goals) {
            // build the list of goal states
            final List<GoalState> states = [];

            goals.forEach((goalId, goal) {
              states.add(GoalState(goal: goal, step: steps[goalId]));
            });

            stateStreamController.sink.add(right(states.toImmutableList()));
          },
        );
      },
    );
  }

  @override
  Stream<Either<GoalFailure, KtList<GoalState>>> watchAll(DateTime fromDate) async* {
    // cancel the previous steps stream subscription
    _stepStreamSubscription?.cancel();

    // listen for goal steps update
    _stepStreamSubscription = _repository.watchSteps(fromDate).listen(_onGoalStepUpdate);

    yield* stateStreamController.stream;
  }

  @override
  Future<Either<GoalFailure, Unit>> create({@required Goal goal}) async {
    return _repository.create(goal: goal);
  }

  @override
  Future<Either<GoalFailure, Unit>> update({@required Goal goal}) async {
    return _repository.update(goal: goal);
  }

  @override
  Future<Either<GoalFailure, Unit>> delete({@required UniqueId goalId}) async {
    return _repository.delete(goalId: goalId);
  }
}
