// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period_count.dart';

part 'goal_period_dto.freezed.dart';
part 'goal_period_dto.g.dart';

@freezed
abstract class GoalPeriodDTO with _$GoalPeriodDTO {
  const factory GoalPeriodDTO.every({
    @required int count,
    @required String kind,
  }) = _GoalPeriodEveryDTO;
  const factory GoalPeriodDTO.onDays({
    @required List<bool> weekdays,
  }) = _GoalPeriodOnDaysDTO;

  factory GoalPeriodDTO.fromDomain(GoalPeriod goalPeriod) {
    return goalPeriod.when(
      every: (data) {
        return GoalPeriodDTO.every(
          count: data.count.getOrCrash(),
          kind: GoalPeriodX.kindToString(data.kind),
        );
      },
      onDay: (data) {
        return GoalPeriodDTO.onDays(
          weekdays: data.weekdays.asList(),
        );
      },
    );
  }

  factory GoalPeriodDTO.fromJson(Map<String, dynamic> json) => _$GoalPeriodDTOFromJson(json);
}

extension GoalPeriodDTOX on GoalPeriodDTO {
  GoalPeriod toDomain() {
    if (this is _GoalPeriodEveryDTO) {
      final o = this as _GoalPeriodEveryDTO;
      return GoalPeriod.every(
        count: GoalPeriodCount(o.count),
        kind: GoalPeriodX.kindFromString(o.kind),
      );
    }
    if (this is _GoalPeriodOnDaysDTO) {
      final o = this as _GoalPeriodOnDaysDTO;
      return GoalPeriod.onDay(weekdays: KtList<bool>.from(o.weekdays));
    }
    return null;
  }
}
