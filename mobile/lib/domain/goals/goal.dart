import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:akrasia/domain/core/entity.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/unique_id.dart';

import 'package:akrasia/domain/goals/goal_name.dart';
import 'package:akrasia/domain/goals/goal_type.dart';
import 'package:akrasia/domain/goals/goal_pledge.dart';
import 'package:akrasia/domain/goals/goal_period.dart';
import 'package:akrasia/domain/goals/goal_unit.dart';
import 'package:akrasia/domain/goals/goal_value.dart';
import 'package:akrasia/domain/goals/goal_period_count.dart';
import 'package:akrasia/domain/goals/goal_start_date.dart';

part 'goal.freezed.dart';

@freezed
abstract class Goal with _$Goal implements IEntity {
  factory Goal({
    @required UniqueId id,
    @required GoalName name,
    @required bool toReach,
    @required GoalType type,
    @required GoalPeriod period,
    @required GoalStartDate startDate,
    DateTime endDate,
    GoalPledge startPledge,
    GoalPledge endPledge,
    DateTime startPause,
    DateTime endPause,
  }) = _Goal;

  factory Goal.empty() => Goal(
        id: UniqueId(),
        name: GoalName(''),
        toReach: true,
        type: GoalType.valueGoal(value: GoalValue(2.0), unit: GoalUnit("km")),
        startDate: GoalStartDate.empty(),
        period: GoalPeriod.every(count: GoalPeriodCount(1), kind: GoalPeriodKind.day),
      );
}

extension GoalX on Goal {
  bool isValid() {
    return failureOption.isNone();
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
        // TODO: validate entity
        .fold((f) => some(f), (_) => none());
  }
}
