import 'package:super_enum/super_enum.dart';

import 'package:akrasia/domain/goals/goal_period_count.dart';

part 'goal_period.super.dart';

enum GoalPeriodKind {
  week,
  day,
  month,
}

@superEnum
enum _GoalPeriod {
  @Data(fields: [
    DataField<GoalPeriodCount>('count'),
    DataField<GoalPeriodKind>('kind'),
  ])
  // ignore: constant_identifier_names
  Every,

  @Data(fields: [
    DataField<bool>('onMonday'),
    DataField<bool>('onTuesday'),
    DataField<bool>('onWednesday'),
    DataField<bool>('onThursday'),
    DataField<bool>('onFriday'),
    DataField<bool>('onSaturday'),
    DataField<bool>('onSunday'),
  ])
  // ignore: constant_identifier_names
  OnDay,
}
