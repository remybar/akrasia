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
