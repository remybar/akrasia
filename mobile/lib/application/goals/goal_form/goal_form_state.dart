part of 'goal_form_bloc.dart';

@freezed
abstract class GoalFormState with _$GoalFormState {
  const factory GoalFormState({
    @required Goal goal,
    @required bool showErrorMessages,
    @required bool isEditing,
    @required bool isSaving,
    @required Option<Either<GoalFailure, Unit>> goalFailureOrSuccessOption,
  }) = _GoalFormState;

  factory GoalFormState.initial() => GoalFormState(
        goal: Goal.empty(),
        showErrorMessages: false,
        isEditing: false,
        isSaving: false,
        goalFailureOrSuccessOption: none(),
      );
}
