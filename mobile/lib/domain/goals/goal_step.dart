// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/core/entity.dart';
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/value_objects/goal_data.dart';
import 'package:akrasia/domain/goals/value_objects/goal_data_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_end_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_name.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_start_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';

part 'goal_step.freezed.dart';

/// An instance of a goal to realize on a specific period of time (could be a day, a week, ...)
/// Contains all the data added for this period.
@freezed
abstract class GoalStep with _$GoalStep implements IEntity {
  const factory GoalStep({
    @required UniqueId id,
    @required UniqueId goalId,
    int pledge,
    @required GoalStartDate startDate,

    // computed from [startDate] and [period]
    @required GoalEndDate endDate,

    // copied from the parent goal
    @required GoalName name,
    @required bool toReach,
    @required GoalPeriod period,
    @required GoalType type,

    // list of data
    @required KtList<GoalData> data,
  }) = _GoalStep;

  factory GoalStep.empty({
    @required UniqueId goalId,
    @required GoalStartDate startDate,
    @required GoalName name,
    @required bool toReach,
    @required GoalPeriod period,
    @required GoalType type,
    int pledge,
  }) =>
      GoalStep(
        id: UniqueId(),
        goalId: goalId,
        startDate: startDate,
        endDate: GoalEndDate(period.computeEndDate(startDate.getOrCrash())),
        name: name,
        toReach: toReach,
        period: period,
        type: type,
        pledge: pledge,
        data: emptyList(),
      );
}

extension GoalStepX on GoalStep {
  bool isActiveAtDate(DateTime fromDate) {
    return startDate.getOrCrash().isBefore(fromDate) && endDate.value.isAfter(fromDate);
  }

  GoalDataValue getCurrentGoalValue() {
    return data.sum();
  }

  // indicate if this step has reached the goal value
  bool isReached() {
    final currentValue = getCurrentGoalValue();
    return (currentValue != null) &&
        type.when(
          yesNoGoal: () => currentValue.whenOrElse(integerData: (d) => d.value > 0, orElse: (_) => null),
          countGoal: (data) => currentValue.whenOrElse(
            integerData: (d) => d.value >= data.countValue.getOrCrash(),
            orElse: (_) => null,
          ),
          timerGoal: (data) => currentValue.whenOrElse(
            integerData: (d) => d.value >= data.timeValue.getOrCrash(),
            orElse: (_) => null,
          ),
          valueGoal: (data) => currentValue.whenOrElse(
            doubleData: (d) => d.value >= data.value.getOrCrash(),
            orElse: (_) => null,
          ),
        );
  }

  // indicate if this step is achieved
  // that means, reached the goal value for a goal where toReach is true,
  // not reached the goal value else.
  bool isAchieved() {
    final bAchieved = isReached();
    return toReach ? bAchieved : !bAchieved;
  }
}
