part of 'goal_watcher_bloc.dart';

@freezed
abstract class GoalWatcherEvent with _$GoalWatcherEvent {
  const factory GoalWatcherEvent.watchAllStarted(DateTime fromDate) = _WatchAllStarted;
  const factory GoalWatcherEvent.goalsReceived(Either<GoalFailure, KtList<GoalStep>> failureOrGoals) = _GoalsReceived;
}
