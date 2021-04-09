// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:akrasia/domain/goals/i_goal_repository.dart';

part 'goal_actor_event.dart';
part 'goal_actor_state.dart';
part 'goal_actor_bloc.freezed.dart';

@injectable
class GoalActorBloc extends Bloc<GoalActorEvent, GoalActorState> {
  final IGoalRepository _repository;

  GoalActorBloc(this._repository) : super(const GoalActorState.initial());

  Stream<GoalActorState> _processEvent(e, {Future<Either<GoalFailure, Unit>> future}) async* {
    yield const GoalActorState.processing();
    final result = await future;
    yield result.fold(
      (f) => GoalActorState.failure(f),
      (_) => const GoalActorState.success(),
    );
  }

  @override
  Stream<GoalActorState> mapEventToState(
    GoalActorEvent event,
  ) async* {
    yield* event.map(
      deleted: (e) async* {
        yield* _processEvent(e, future: _repository.delete(goalId: e.goalId));
      },
      paused: (e) async* {
        // TODO: pause event
      },
      stepUpdated: (e) async* {
        yield* _processEvent(e, future: _repository.updateStep(step: e.step));
      },
    );
  }
}
