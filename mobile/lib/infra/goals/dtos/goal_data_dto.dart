// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:akrasia/domain/goals/value_objects/goal_data.dart';
import 'package:akrasia/infra/goals/dtos/goal_data_value_dto.dart';

part 'goal_data_dto.freezed.dart';
part 'goal_data_dto.g.dart';

@freezed
abstract class GoalDataDTO with _$GoalDataDTO {
  const factory GoalDataDTO({
    @required GoalDataValueDTO value,
    @required DateTime date,
  }) = _GoalDataDTO;

  factory GoalDataDTO.fromDomain(GoalData data) {
    return GoalDataDTO(
      date: data.date,
      value: GoalDataValueDTO.fromDomain(data.value),
    );
  }

  factory GoalDataDTO.fromJson(Map<String, dynamic> json) => _$GoalDataDTOFromJson(json);
}

extension GoalDataDTOX on GoalDataDTO {
  GoalData toDomain() {
    return GoalData(
      date: date,
      value: value.toDomain(),
    );
  }
}
