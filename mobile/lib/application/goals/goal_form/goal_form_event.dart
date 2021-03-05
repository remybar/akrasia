part of 'goal_form_bloc.dart';

@freezed
abstract class GoalFormEvent with _$GoalFormEvent {
  const factory GoalFormEvent.initialized(Option<Goal> goalOption) = _Initialized;
  const factory GoalFormEvent.nameChanged(String nameStr) = _NameChanged;
  const factory GoalFormEvent.saved() = _Saved;
}
