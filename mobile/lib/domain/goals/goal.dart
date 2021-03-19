// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:akrasia/domain/core/entity.dart';
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/goals/value_objects/goal_name.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge.dart';
import 'package:akrasia/domain/goals/value_objects/goal_start_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';

part 'goal.freezed.dart';

/// Goal Entity.
/// Represents a goal with all its characteristics such as its name,
/// its period, its type, ...
@freezed
abstract class Goal with _$Goal implements IEntity {
  factory Goal({
    @required UniqueId id,
    @required GoalName name,
    @required bool toReach,
    @required GoalType type,
    @required GoalPeriod period,
    @required GoalStartDate startDate,
    @required GoalPledge pledge,
    DateTime endDate,
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
