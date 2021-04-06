// Package imports:
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/core/entity.dart';
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/value_objects/goal_data.dart';
import 'package:akrasia/domain/goals/value_objects/goal_data_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_end_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_start_date.dart';

part 'goal_step.freezed.dart';

/// An instance of a goal to realize on a specific period of time (could be a day, a week, ...)
/// Contains all the data added for this period.
@freezed
abstract class GoalStep with _$GoalStep implements IEntity {
  /// default goal step constructor.
  const factory GoalStep._({
    @required UniqueId id,

    // the goal ID used to create this step
    @required Goal goal,

    // the goal step starting date
    @required GoalStartDate startDate,

    // computed from [startDate] and [period]
    @required GoalEndDate endDate,

    // current pledge value for the step
    GoalPledgeValue pledge,

    // list of data
    @required KtList<GoalData> data,
  }) = _GoalStep;

  /// create an empty goal step from a goal
  factory GoalStep.fromGoal({
    @required Goal goal,
    @required GoalStartDate startDate,
    UniqueId id,
    GoalPledgeValue pledge,
    KtList<GoalData> data,
  }) {
    return GoalStep._(
      id: id ?? UniqueId(),
      goal: goal,
      startDate: startDate,
      endDate: GoalEndDate(goal.period.computeEndDate(startDate.getOrCrash())),
      pledge: pledge,
      data: data ?? emptyList(),
    );
  }
}

extension GoalStepX on GoalStep {
  // indicate if the goal step is active at [fromDate]
  bool isActiveAtDate(DateTime fromDate) {
    return startDate.getOrCrash().isBefore(fromDate) && endDate.value.isAfter(fromDate);
  }

  // get the current global step value from the list of goal data
  GoalDataValue getCurrentGoalValue() {
    return data.sum();
  }

  // indicate if this step has reached the goal value
  bool isReached() {
    final currentValue = getCurrentGoalValue();
    return (currentValue != null) &&
        goal.type.when(
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
    return goal.toReach ? bAchieved : !bAchieved;
  }
}
