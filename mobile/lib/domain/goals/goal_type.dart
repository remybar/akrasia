import 'package:flutter/material.dart';
import 'package:super_enum/super_enum.dart';

import 'package:akrasia/domain/goals/goal_unit.dart';
import 'package:akrasia/domain/goals/goal_value.dart';
import 'package:akrasia/domain/goals/goal_count_value.dart';
import 'package:akrasia/domain/goals/goal_time_value.dart';

part 'goal_type.super.dart';

@superEnum
enum _GoalType {
  @object
  YesNoGoal,

  @Data(fields: [DataField<GoalCountValue>('countValue')])
  CountGoal,

  @Data(fields: [DataField<GoalTimeValue>('timeValue')])
  TimerGoal,

  @Data(fields: [DataField<GoalValue>('value'), DataField<GoalUnit>('unit')])
  ValueGoal,
}
