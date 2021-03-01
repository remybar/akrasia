import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:akrasia/domain/core/entity.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/unique_id.dart';

import 'package:akrasia/domain/goals/goal_name.dart';
// import 'package:akrasia/domain/goals/goal_date.dart';
// import 'package:akrasia/domain/goals/goal_value.dart';
// import 'package:akrasia/domain/goals/goal_unit.dart';
// import 'package:akrasia/domain/goals/goal_pledge.dart';

part 'goal.freezed.dart';

@freezed
abstract class Goal with _$Goal implements IEntity {
  const factory Goal({
    @required UniqueId id,
    @required GoalName name,
    @required bool toReach,
    // @required GoalDate startDate,
    // GoalDate endDate,
    // @required GoalValue value,
    // @required GoalUnit unit,
    // GoalPledge startPledge,
    // GoalPledge endPledge,
    // GoalDate startPause,
    // GoalDate endPause,
  }) = _Goal;
  // start/end dates
  // type of goal
  //GoalType type;

  /// period of time for each goal step from this goal template
  // PeriodType periodType;

  factory Goal.empty() => Goal(
        id: UniqueId(),
        name: GoalName(''),
        toReach: true,
        // startDate: GoalDate(DateTime.now()),
        // value: GoalValue(1.0),
        // unit: GoalUnit(''),
      );
}

extension GoalX on Goal {
  /// Validate the whole goal by checking all its value objects
  Option<ValueFailure<dynamic>> get failureOption {
    /// TODO: to complete
    return name.failureOrUnit
        // .andThen(startDate.failureOrUnit)
        // .andThen(value.failureOrUnit)
        // .andThen(unit.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
