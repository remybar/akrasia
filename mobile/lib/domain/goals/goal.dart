// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:akrasia/domain/core/entity.dart';
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:akrasia/domain/goals/value_objects/goal_end_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_name.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge.dart';
import 'package:akrasia/domain/goals/value_objects/goal_start_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';

part 'goal.freezed.dart';

/// Goal Entity.
/// Represents a goal to realize from [startDate] to [endDate] or forever.
/// A goal is then splitted into step according to the defined [period].
/// The fields [toReach] and [startDate] (if already started) cannot be modified.
/// Modification of the fields [name], [startDate], [endDate], [pledge] and [type] are global to all steps.
/// Modification of the field [period] and the goal value stored in the field [type] are applied
/// to the next steps.
@freezed
abstract class Goal with _$Goal implements IEntity {
  factory Goal({
    @required UniqueId id,
    @required GoalName name,
    @required bool toReach,
    @required GoalType type,
    @required GoalPeriod period,
    @required GoalStartDate startDate,
    GoalEndDate endDate,
    @required GoalPledge pledge,
  }) = _Goal;

  factory Goal.empty() => Goal(
        id: UniqueId(),
        name: GoalName(''),
        toReach: true,
        type: GoalType.yesNoGoal(),
        startDate: GoalStartDate.empty(),
        period: GoalPeriodX.defaultEvery(),
        pledge: GoalPledge.noPledge(),
      );
}

extension GoalX on Goal {
  bool isValid() {
    return failureOption.isNone();
  }

  // Create a new step from the current goal.
  // If a [fromStep] is specified, create a new step just after this [fromStep].
  GoalStep createStep({GoalStep fromStep}) {
    if (fromStep != null) {
      return GoalStep.fromGoal(
        goal: this,
        startDate: GoalStartDate(period.shiftDate(fromStep.startDate.getOrCrash())),
      );
    } else {
      return GoalStep.fromGoal(
        goal: this,
        startDate: GoalStartDate(startDate.getOrCrash()),
        pledge: fromStep.pledge,
      );
    }
  }

  /// Validate the whole goal by checking all its value objects
  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(type.when(
          yesNoGoal: () => right(unit),
          countGoal: (goal) => goal.countValue.failureOrUnit,
          timerGoal: (goal) => goal.timeValue.failureOrUnit,
          valueGoal: (goal) => goal.value.failureOrUnit.andThen(goal.unit.failureOrUnit),
        ))
        .andThen(startDate.failureOrUnit)
        .andThen(
          pledge.when(
            noPledge: () => right(unit),
            pledge: (data) => data.start.failureOrUnit.andThen(data.max.failureOrUnit),
          ),
        )
        .fold((f) => some(f), (_) => none());
  }
}
