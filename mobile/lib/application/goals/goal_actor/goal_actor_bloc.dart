// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/i_goal_repository.dart';

part 'goal_actor_event.dart';
part 'goal_actor_state.dart';
part 'goal_actor_bloc.freezed.dart';

@injectable
class GoalActorBloc extends Bloc<GoalActorEvent, GoalActorState> {
  final IGoalRepository _repository;

  GoalActorBloc(this._repository) : super(const GoalActorState.initial());

  @override
  Stream<GoalActorState> mapEventToState(
    GoalActorEvent event,
  ) async* {
    yield* event.map(
      deleted: (e) async* {
        yield const GoalActorState.deleting();
        final result = await _repository.delete(event.goal);
        yield result.fold(
          (f) => GoalActorState.deleteFailure(f),
          (_) => const GoalActorState.deleteSuccess(),
        );
      },
      paused: (e) async* {
        // TODO: pause event
      },
    );
  }
}
