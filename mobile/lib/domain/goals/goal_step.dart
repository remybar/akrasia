// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/core/misc/utils.dart';
import 'package:akrasia/domain/core/entity.dart';
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/value_objects/goal_data.dart';
import 'package:akrasia/domain/goals/value_objects/goal_data_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_end_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_start_date.dart';

part 'goal_step.freezed.dart';

/// An instance of a goal to realize on a specific period of time (could be a day, a week, ...)
/// Contains all the data added for this period.
@freezed
abstract class GoalStep with _$GoalStep implements IEntity {
  /// default goal step constructor.
  const factory GoalStep({
    @required UniqueId id,

    // the goal ID used to create this step
    @required UniqueId goalId,

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
    return GoalStep(
      id: id ?? UniqueId(),
      goalId: goal.id,
      startDate: startDate,
      endDate: GoalEndDate(goal.period.computeEndDate(startDate.getOrCrash())),
      pledge: pledge ??
          goal.pledge.when(
            noPledge: () => GoalPledgeValue(0),
            pledge: (p) => p.start,
          ),
      data: data ?? emptyList(),
    );
  }
}

extension GoalStepX on GoalStep {
  // indicate if the goal step is active at [date]
  bool isActiveAtDate(DateTime date) {
    return startDate.getOrCrash().isBeforeOrEqual(date) && endDate.value.isAfterOrEqual(date);
  }

  // get the current global step value from the list of goal data
  GoalDataValue getCurrentGoalValue() {
    return data.sum();
  }
}
