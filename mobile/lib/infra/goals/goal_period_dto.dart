import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:akrasia/domain/goals/goal_period.dart';
import 'package:akrasia/domain/goals/goal_period_count.dart';

part 'goal_period_dto.freezed.dart';
part 'goal_period_dto.g.dart';

@freezed
abstract class GoalPeriodDTO with _$GoalPeriodDTO {
  const factory GoalPeriodDTO(
    String name,
  ) = _GoalPeriodDTO;

  factory GoalPeriodDTO.fromDomain(GoalPeriod goalPeriod) {
    //TODO
    return GoalPeriodDTO("TODO");
  }

  factory GoalPeriodDTO.fromJson(Map<String, dynamic> json) => _$GoalPeriodDTOFromJson(json);
}

extension GoalPeriodDTOX on GoalPeriodDTO {
  GoalPeriod toDomain() {
    return GoalPeriod.every(count: GoalPeriodCount(1), kind: GoalPeriodKind.day);
    //TODO
  }
}
