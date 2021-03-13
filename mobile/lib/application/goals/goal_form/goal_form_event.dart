part of 'goal_form_bloc.dart';

@freezed
abstract class GoalFormEvent with _$GoalFormEvent {
  const factory GoalFormEvent.initialized(Option<Goal> goalOption) = _Initialized;
  const factory GoalFormEvent.nameChanged(String nameStr) = _NameChanged;
  const factory GoalFormEvent.startDateChanged(DateTime startDate) = _StartDateChanged;
  const factory GoalFormEvent.endDateRemoved() = _EndDateRemoved;
  const factory GoalFormEvent.endDateChanged(DateTime endDate) = _EndDateChanged;
  const factory GoalFormEvent.periodChanged(GoalPeriod period) = _PeriodChanged;
  const factory GoalFormEvent.saved() = _Saved;
}
