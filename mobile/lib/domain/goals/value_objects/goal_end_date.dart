// A goal end date has a time set to 23:59:59
class GoalEndDate {
  final DateTime value;

  factory GoalEndDate(DateTime input) {
    return GoalEndDate._(
      (input != null) ? DateTime(input.year, input.month, input.day, 23, 59, 59) : null,
    );
  }

  factory GoalEndDate.empty() => GoalEndDate(DateTime.now());

  const GoalEndDate._(this.value);
}
