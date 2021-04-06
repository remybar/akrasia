// Dart imports:
import 'dart:async';

// Package imports:
import 'package:akrasia/domain/goals/i_goal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal_step.dart';

part 'goal_watcher_event.dart';
part 'goal_watcher_state.dart';
part 'goal_watcher_bloc.freezed.dart';

/// GoalWatcherBloc is responsible for requesting goal steps using its event
/// [watchAllStarted] and subscribe to the return stream to be notified of any
/// change in goal step list through the event [goalsReceived].
@injectable
class GoalWatcherBloc extends Bloc<GoalWatcherEvent, GoalWatcherState> {
  final IGoalRepository _repository;
  GoalWatcherBloc(this._repository) : super(const GoalWatcherState.initial());

  StreamSubscription<Either<GoalFailure, KtList<GoalStep>>> _goalStreamSubscription;

  @override
  Stream<GoalWatcherState> mapEventToState(
    GoalWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const GoalWatcherState.loading();
        await _goalStreamSubscription?.cancel();
        _goalStreamSubscription = _repository.watchAll(fromDate: e.fromDate).listen(
              (goals) => add(GoalWatcherEvent.goalsReceived(goals)),
            );
      },
      goalsReceived: (e) async* {
        yield e.failureOrGoals.fold(
          (failure) => GoalWatcherState.loadFailure(failure),
          (goals) => GoalWatcherState.loaded(goals),
        );
      },
    );
  }
}
