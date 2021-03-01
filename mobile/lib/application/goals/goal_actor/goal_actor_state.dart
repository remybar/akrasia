part of 'goal_actor_bloc.dart';

@freezed
abstract class GoalActorState with _$GoalActorState {
  const factory GoalActorState.initial() = _Initial;
  const factory GoalActorState.deleting() = _Deleting;
  const factory GoalActorState.deleteFailure(GoalFailure failure) = _DeleteFailure;
  const factory GoalActorState.deleteSuccess() = _DeleteSuccess;
}
