// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal_state.dart';
import 'package:akrasia/domain/goals/i_goal_manager.dart';

part 'goal_watcher_event.dart';
part 'goal_watcher_state.dart';
part 'goal_watcher_bloc.freezed.dart';

/// GoalWatcherBloc is responsible for requesting goal steps using its event
/// [watchAllStarted] and subscribe to the return stream to be notified of any
/// change in goal step list through the event [goalsReceived].
@injectable
class GoalWatcherBloc extends Bloc<GoalWatcherEvent, GoalWatcherState> {
  final IGoalManager _manager;
  GoalWatcherBloc(this._manager) : super(const GoalWatcherState.initial());

  StreamSubscription<Either<GoalFailure, KtList<GoalState>>> _goalStreamSubscription;

  @override
  Stream<GoalWatcherState> mapEventToState(
    GoalWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const GoalWatcherState.loading();
        await _goalStreamSubscription?.cancel();
        _goalStreamSubscription = _manager.watchAll(e.fromDate).listen(
              (goals) => add(GoalWatcherEvent.goalsReceived(goals)),
            );
      },
      goalsReceived: (e) async* {
        // TODO: convert the list of goal states from the domain into a list of "UI goals"
        // TODO: easier to manipulate at UI level
        yield e.failureOrGoals.fold(
          (failure) => GoalWatcherState.loadFailure(failure),
          (goals) => GoalWatcherState.loaded(goals),
        );
      },
    );
  }
}
