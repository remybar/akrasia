import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/goal_name.dart';
import 'package:akrasia/domain/goals/i_goal_repository.dart';

part 'goal_form_event.dart';
part 'goal_form_state.dart';
part 'goal_form_bloc.freezed.dart';

@injectable
class GoalFormBloc extends Bloc<GoalFormEvent, GoalFormState> {
  final IGoalRepository _repository;

  GoalFormBloc(this._repository) : super(GoalFormState.initial());

  @override
  Stream<GoalFormState> mapEventToState(
    GoalFormEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.goalOption.fold(
          () => state,
          (initialGoal) => state.copyWith(goal: initialGoal, isEditing: true),
        );
      },
      nameChanged: (e) async* {
        yield state.copyWith(
          goal: state.goal.copyWith(name: GoalName(e.nameStr)),
          goalFailureOrSuccessOption: none(),
        );
      },
      saved: (e) async* {
        Either<GoalFailure, Unit> failureOrSuccess;

        yield state.copyWith(
          isSaving: true,
          goalFailureOrSuccessOption: none(),
        );

        if (state.goal.failureOption.isNone()) {
          failureOrSuccess =
              state.isEditing ? await _repository.update(state.goal) : await _repository.create(state.goal);
        }

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          goalFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
