// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:akrasia/domain/goals/value_objects/goal_end_date.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_start_date.dart';
import 'package:akrasia/infra/goals/dtos/goal_data_dto.dart';

part 'goal_step_dto.freezed.dart';
part 'goal_step_dto.g.dart';

@freezed
abstract class GoalStepDTO with _$GoalStepDTO {
  const factory GoalStepDTO({
    @JsonKey(ignore: true) String id,
    @JsonKey(ignore: true) String goalId,
    int pledge,
    @required DateTime startDate,
    @required DateTime endDate,
    @required List<GoalDataDTO> data,
  }) = _GoalStepDTO;

  factory GoalStepDTO.fromDomain(GoalStep step) {
    return GoalStepDTO(
      id: step.id.getOrCrash(),
      goalId: step.goalId.getOrCrash(),
      startDate: step.startDate.getOrCrash(),
      endDate: step.endDate.value,
      data: step.data
          .mapIndexed(
            (index, item) => GoalDataDTO.fromDomain(item),
          )
          .asList(),
    );
  }

  factory GoalStepDTO.fromJson(Map<String, dynamic> json) => _$GoalStepDTOFromJson(json);

  factory GoalStepDTO.fromFirestore(DocumentSnapshot document) {
    return GoalStepDTO.fromJson(document.data()).copyWith(
      id: document.id,
      goalId: document.reference.parent.parent.id,
    );
  }
}

extension GoalStepDTOX on GoalStepDTO {
  GoalStep toDomain() {
    return GoalStep(
      id: UniqueId.fromUniqueString(id),
      goalId: UniqueId.fromUniqueString(goalId),
      startDate: GoalStartDate(startDate),
      endDate: GoalEndDate(endDate),
      pledge: GoalPledgeValue(pledge),
      data: data.map((item) => item.toDomain()).toImmutableList(),
    );
  }
}
