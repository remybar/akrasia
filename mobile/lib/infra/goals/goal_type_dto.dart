import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:akrasia/domain/goals/goal_type.dart';
import 'package:akrasia/domain/goals/goal_count_value.dart';
import 'package:akrasia/domain/goals/goal_time_value.dart';
import 'package:akrasia/domain/goals/goal_unit.dart';
import 'package:akrasia/domain/goals/goal_value.dart';

part 'goal_type_dto.freezed.dart';
part 'goal_type_dto.g.dart';

@freezed
abstract class GoalTypeDTO with _$GoalTypeDTO {
  const factory GoalTypeDTO({
    @required String name,
    double value,
    String unit,
  }) = _GoalTypeDTO;

  factory GoalTypeDTO.fromDomain(GoalType goalType) {
    return goalType.when(
      yesNoGoal: () => GoalTypeDTO(name: "yesno"),
      countGoal: (goal) => GoalTypeDTO(
        name: "count",
        value: goal.countValue.getOrCrash().toDouble(),
      ),
      timerGoal: (goal) => GoalTypeDTO(
        name: "timer",
        value: goal.timeValue.getOrCrash().toDouble(),
      ),
      valueGoal: (goal) => GoalTypeDTO(
        name: "value",
        value: goal.value.getOrCrash(),
        unit: goal.unit.getOrCrash(),
      ),
    );
  }

  factory GoalTypeDTO.fromJson(Map<String, dynamic> json) => _$GoalTypeDTOFromJson(json);
}

extension GoalTypeDTOX on GoalTypeDTO {
  GoalType toDomain() {
    switch (name) {
      case "yesno":
        return GoalType.yesNoGoal();
      case "count":
        return GoalType.countGoal(countValue: GoalCountValue(value?.toInt()));
      case "timer":
        return GoalType.timerGoal(timeValue: GoalTimeValue(value.toInt()));
      case "value":
        return GoalType.valueGoal(
          value: GoalValue(value),
          unit: GoalUnit(unit),
        );
      default:
        return null;
    }
  }
}
