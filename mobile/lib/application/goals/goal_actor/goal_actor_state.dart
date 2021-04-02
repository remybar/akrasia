part of 'goal_actor_bloc.dart';

@freezed
abstract class GoalActorState with _$GoalActorState {
  const factory GoalActorState.initial() = _Initial;
  const factory GoalActorState.processing() = _Processing;
  const factory GoalActorState.failure(GoalFailure failure) = _Failure;
  const factory GoalActorState.success() = _Success;
}
