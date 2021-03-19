// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:super_enum/super_enum.dart';

// Project imports:
import './goal_count_value.dart';
import './goal_time_value.dart';
import './goal_unit.dart';
import './goal_value.dart';

part 'goal_type.super.dart';

@superEnum
enum _GoalType {
  @object
  // ignore: constant_identifier_names
  YesNoGoal,

  @Data(fields: [DataField<GoalCountValue>('countValue')])
  // ignore: constant_identifier_names
  CountGoal,

  @Data(fields: [DataField<GoalTimeValue>('timeValue')])
  // ignore: constant_identifier_names
  TimerGoal,

  @Data(fields: [DataField<GoalValue>('value'), DataField<GoalUnit>('unit')])
  // ignore: constant_identifier_names
  ValueGoal,
}

extension GoalTypeX on GoalType {
  static GoalType defaultCountGoal() {
    return GoalType.countGoal(countValue: GoalCountValue(1));
  }

  static GoalType defaultTimeGoal() {
    return GoalType.timerGoal(timeValue: GoalTimeValue(300));
  }

  static GoalType defaultValueGoal() {
    return GoalType.valueGoal(value: GoalValue(0), unit: GoalUnit(""));
  }
}
