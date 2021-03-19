// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:akrasia/domain/goals/value_objects/goal_count_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_time_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';
import 'package:akrasia/domain/goals/value_objects/goal_unit.dart';
import 'package:akrasia/domain/goals/value_objects/goal_value.dart';

part 'goal_type_dto.freezed.dart';
part 'goal_type_dto.g.dart';

@freezed
abstract class GoalTypeDTO with _$GoalTypeDTO {
  const factory GoalTypeDTO.yesno() = _GoalTypeYesNoDTO;
  const factory GoalTypeDTO.count({@required int countValue}) = _GoalTypeCountDTO;
  const factory GoalTypeDTO.timer({@required int timerValue}) = _GoalTypeTimerDTO;
  const factory GoalTypeDTO.value({@required double value, @required String unit}) = _GoalTypeValueDTO;

  factory GoalTypeDTO.fromDomain(GoalType goalType) {
    return goalType.when(
      yesNoGoal: () => const GoalTypeDTO.yesno(),
      countGoal: (goal) => GoalTypeDTO.count(countValue: goal.countValue.getOrCrash()),
      timerGoal: (goal) => GoalTypeDTO.timer(timerValue: goal.timeValue.getOrCrash()),
      valueGoal: (goal) => GoalTypeDTO.value(
        value: goal.value.getOrCrash(),
        unit: goal.unit.getOrCrash(),
      ),
    );
  }

  factory GoalTypeDTO.fromJson(Map<String, dynamic> json) => _$GoalTypeDTOFromJson(json);
}

extension GoalTypeDTOX on GoalTypeDTO {
  GoalType toDomain() {
    if (this is _GoalTypeYesNoDTO) {
      return GoalType.yesNoGoal();
    }
    if (this is _GoalTypeCountDTO) {
      final o = this as _GoalTypeCountDTO;
      return GoalType.countGoal(countValue: GoalCountValue(o.countValue));
    }
    if (this is _GoalTypeTimerDTO) {
      final o = this as _GoalTypeTimerDTO;
      return GoalType.timerGoal(timeValue: GoalTimeValue(o.timerValue));
    }
    if (this is _GoalTypeValueDTO) {
      final o = this as _GoalTypeValueDTO;
      return GoalType.valueGoal(value: GoalValue(o.value), unit: GoalUnit(o.unit));
    }
    return null;
  }
}
