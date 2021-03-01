part of 'goal_watcher_bloc.dart';

@freezed
abstract class GoalWatcherState with _$GoalWatcherState {
  const factory GoalWatcherState.initial() = _Initial;
  const factory GoalWatcherState.loading() = _Loading;
  const factory GoalWatcherState.loaded(KtList<Goal> goals) = _Loaded;
  const factory GoalWatcherState.loadFailure(GoalFailure failure) = _LoadFailure;
}
