// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:akrasia/domain/goals/value_objects/goal_data_value.dart';

part 'goal_data_value_dto.freezed.dart';
part 'goal_data_value_dto.g.dart';

@freezed
abstract class GoalDataValueDTO with _$GoalDataValueDTO {
  const factory GoalDataValueDTO.i({@required int value}) = _IntGoalDataValueDTO;
  const factory GoalDataValueDTO.d({@required double value}) = _DoubleGoalDataValueDTO;

  factory GoalDataValueDTO.fromDomain(GoalDataValue dataValue) {
    return dataValue.when(
      integerData: (data) => GoalDataValueDTO.i(value: data.value),
      doubleData: (data) => GoalDataValueDTO.d(value: data.value),
    );
  }

  factory GoalDataValueDTO.fromJson(Map<String, dynamic> json) => _$GoalDataValueDTOFromJson(json);
}

extension GoalDataValueDTOX on GoalDataValueDTO {
  GoalDataValue toDomain() {
    if (this is _IntGoalDataValueDTO) {
      final o = this as _IntGoalDataValueDTO;
      return GoalDataValue.integerData(value: o.value);
    }
    if (this is _DoubleGoalDataValueDTO) {
      final o = this as _DoubleGoalDataValueDTO;
      return GoalDataValue.doubleData(value: o.value);
    }
    return null;
  }
}
