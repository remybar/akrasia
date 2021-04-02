part of 'goal_actor_bloc.dart';

@freezed
abstract class GoalActorEvent with _$GoalActorEvent {
  // delete a goal
  const factory GoalActorEvent.deleted({UniqueId goalId}) = _Deleted;

  // pause a goal
  const factory GoalActorEvent.paused({UniqueId goalId}) = _Paused;
  const factory GoalActorEvent.stepUpdated({@required GoalStep step}) = _StepUpdated;
}
