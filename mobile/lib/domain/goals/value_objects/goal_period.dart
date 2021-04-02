// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:kt_dart/kt.dart';
import 'package:super_enum/super_enum.dart';

// Project imports:
import './goal_period_count.dart';

part 'goal_period.super.dart';

enum GoalPeriodKind {
  week,
  day,
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

  static String kindToString(GoalPeriodKind kind) {
    return describeEnum(kind);
  }

  static GoalPeriodKind kindFromString(String value) {
    switch (value) {
      case "week":
        return GoalPeriodKind.week;
      case "day":
        return GoalPeriodKind.day;
      default:
        return null;
    }
  }

  DateTime computeEndDate(DateTime startDate) {
    final DateTime date = shiftDate(startDate);
    return date.subtract(const Duration(seconds: 1));
  }

  // shift [date] of one period
  DateTime shiftDate(DateTime date) {
    return when(
      every: (value) {
        final count = value.count.getOrCrash();
        switch (value.kind) {
          case GoalPeriodKind.day:
            return date.add(Duration(days: count));
          case GoalPeriodKind.week:
            return date.add(Duration(days: 7 * count));
          default:
            return null;
        }
      },
      onDay: (_) => date.add(const Duration(days: 7)),
    );
  }
}
