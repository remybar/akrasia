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
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/i_goal_repository.dart';

part 'goal_watcher_event.dart';
part 'goal_watcher_state.dart';
part 'goal_watcher_bloc.freezed.dart';

@injectable
class GoalWatcherBloc extends Bloc<GoalWatcherEvent, GoalWatcherState> {
  final IGoalRepository _repository;
  StreamSubscription<Either<GoalFailure, KtList<Goal>>> _streamSubscription;

  GoalWatcherBloc(this._repository) : super(const GoalWatcherState.initial());

  @override
  Stream<GoalWatcherState> mapEventToState(
    GoalWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const GoalWatcherState.loading();
        await _streamSubscription?.cancel();
        _streamSubscription = _repository.watchAll().listen((goals) => add(GoalWatcherEvent.goalsReceived(goals)));
      },
      goalsReceived: (e) async* {
        yield e.failureOrGoals.fold(
          (f) => GoalWatcherState.loadFailure(f),
          (goals) => GoalWatcherState.loaded(goals),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    return super.close();
  }
}
