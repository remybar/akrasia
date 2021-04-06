// Dart imports:
import 'dart:async';

// Package imports:
import 'package:akrasia/domain/goals/i_goal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:akrasia/domain/goals/value_objects/goal_end_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_name.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge.dart';
import 'package:akrasia/domain/goals/value_objects/goal_start_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';

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
      startDateChanged: (e) async* {
        final endDate = state.goal.endDate;
        yield state.copyWith(
          goal: state.goal.copyWith(
            startDate: GoalStartDate(e.startDate),
            endDate: (endDate?.value != null && endDate.value.isAfter(e.startDate)) ? endDate : null,
          ),
          goalFailureOrSuccessOption: none(),
        );
      },
      endDateChanged: (e) async* {
        yield state.copyWith(
          goal: state.goal.copyWith(endDate: GoalEndDate(e.endDate)),
          goalFailureOrSuccessOption: none(),
        );
      },
      endDateRemoved: (e) async* {
        yield state.copyWith(
          goal: state.goal.copyWith(endDate: null),
          goalFailureOrSuccessOption: none(),
        );
      },
      periodChanged: (e) async* {
        yield state.copyWith(
          goal: state.goal.copyWith(period: e.period),
          goalFailureOrSuccessOption: none(),
        );
      },
      pledgeChanged: (e) async* {
        yield state.copyWith(
          goal: state.goal.copyWith(pledge: e.pledge),
          goalFailureOrSuccessOption: none(),
        );
      },
      typeChanged: (e) async* {
        yield state.copyWith(
          goal: state.goal.copyWith(type: e.type),
          goalFailureOrSuccessOption: none(),
        );
      },
      saved: (e) async* {
        Either<GoalFailure, Unit> failureOrSuccess;

        // inform that we are starting saving the goal
        yield state.copyWith(
          isSaving: true,
          goalFailureOrSuccessOption: none(),
        );

        // save if the goal is valid
        if (state.goal.isValid()) {
          failureOrSuccess =
              state.isEditing ? await _repository.update(goal: state.goal) : await _repository.create(goal: state.goal);
        }

        // inform that the goal has been saved or some failures have been raised
        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          goalFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
