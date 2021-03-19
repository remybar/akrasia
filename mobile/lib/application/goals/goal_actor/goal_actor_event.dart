part of 'goal_actor_bloc.dart';

@freezed
abstract class GoalActorEvent with _$GoalActorEvent {
  const factory GoalActorEvent.deleted({Goal goal}) = _Deleted;
  const factory GoalActorEvent.paused({Goal goal}) = _Paused;
}
