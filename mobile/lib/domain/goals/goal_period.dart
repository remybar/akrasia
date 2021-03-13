import 'package:kt_dart/kt.dart';
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
    DataField<KtList<bool>>('weekdays'),
  ])
  // ignore: constant_identifier_names
  OnDay,
}

extension GoalPeriodX on GoalPeriod {
  static final _defaultCount = GoalPeriodCount(1);
  static const _defaultKind = GoalPeriodKind.day;
  static final _defaultWeekdays = listOf(true, true, true, true, true, true, true);

  static GoalPeriod defaultEvery() {
    return GoalPeriod.every(count: _defaultCount, kind: _defaultKind);
  }

  static GoalPeriod defaultOn() {
    return GoalPeriod.onDay(weekdays: _defaultWeekdays);
  }
}
