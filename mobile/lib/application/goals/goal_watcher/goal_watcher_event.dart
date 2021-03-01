part of 'goal_watcher_bloc.dart';

@freezed
abstract class GoalWatcherEvent with _$GoalWatcherEvent {
  const factory GoalWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory GoalWatcherEvent.watchAllStartedAtDate(DateTime date) = _WatchAllStartedAtDate;
  const factory GoalWatcherEvent.goalsReceived(
    Either<GoalFailure, KtList<Goal>> failureOrGoals,
  ) = _GoalReceived;
}
