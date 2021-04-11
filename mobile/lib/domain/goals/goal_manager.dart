// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/i_goal_manager.dart';
import 'package:akrasia/domain/goals/i_goal_repository.dart';
import 'goal.dart';
import 'goal_failure.dart';
import 'goal_state.dart';
import 'goal_step.dart';

@LazySingleton(as: IGoalManager)
class GoalManager implements IGoalManager {
  final IGoalRepository _repository;

  // controller to provide list of goal states to the application layer through a stream
  final stateStreamController = StreamController<Either<GoalFailure, KtList<GoalState>>>.broadcast();

  // stream subscriptions to be notified about goals and steps update
  StreamSubscription<Either<GoalFailure, KtPair<DateTime, Map<UniqueId, GoalStep>>>> _stepStreamSubscription;
  StreamSubscription<Either<GoalFailure, KtPair<DateTime, Map<UniqueId, Goal>>>> _goalStreamSubscription;

  bool _firstGoalUpdate;

  GoalManager(this._repository);

  Future<void> dispose() async {
    _goalStreamSubscription?.cancel();
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

  // Handle goal update by building a list of goal states and add them to the state stream
  // ignore: avoid_void_async
  void _onGoalUpdate(Either<GoalFailure, KtPair<DateTime, Map<UniqueId, Goal>>> data) async {
    // do not take into account the first notification as the goal state list is already built
    // through goal steps update notification.
    if (!_firstGoalUpdate) {
      data.fold(
        (failure) => stateStreamController.sink.add(left(failure)),
        (data) async {
          final fromDate = data.first;
          final goals = data.second;

          // get the list of goal steps at the specific date
          final steps = await _repository.getSteps(fromDate: fromDate);

          steps.fold(
            (failure) => stateStreamController.sink.add(left(failure)),
            (steps) {
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
    _firstGoalUpdate = false;
  }

  @override
  Stream<Either<GoalFailure, KtList<GoalState>>> watchAll(DateTime fromDate) async* {
    _goalStreamSubscription?.cancel();
    _stepStreamSubscription?.cancel();
    _firstGoalUpdate = true;

    _goalStreamSubscription = _repository.watchGoals(fromDate).listen(_onGoalUpdate);
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
