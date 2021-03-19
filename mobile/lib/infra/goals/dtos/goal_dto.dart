// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/value_objects/goal_name.dart';
import 'package:akrasia/domain/goals/value_objects/goal_start_date.dart';
import './goal_period_dto.dart';
import './goal_pledge_dto.dart';
import './goal_type_dto.dart';

part 'goal_dto.freezed.dart';
part 'goal_dto.g.dart';

@freezed
abstract class GoalDTO implements _$GoalDTO {
  factory GoalDTO({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required bool toReach,
    @required GoalTypeDTO type,
    @required GoalPeriodDTO period,
    @required DateTime startDate,
    @required GoalPledgeDTO pledge,
    DateTime endDate,
  }) = _GoalDTO;

  factory GoalDTO.fromDomain(Goal goal) {
    return GoalDTO(
      id: goal.id.getOrCrash(),
      name: goal.name.getOrCrash(),
      type: GoalTypeDTO.fromDomain(goal.type),
      period: GoalPeriodDTO.fromDomain(goal.period),
      toReach: goal.toReach,
      startDate: goal.startDate.getOrCrash(),
      pledge: GoalPledgeDTO.fromDomain(goal.pledge),
      endDate: goal.endDate,
    );
  }

  factory GoalDTO.fromJson(Map<String, dynamic> json) => _$GoalDTOFromJson(json);

  factory GoalDTO.fromFirestore(DocumentSnapshot document) {
    return GoalDTO.fromJson(document.data()).copyWith(id: document.id);
  }
}

extension GoalDTOX on GoalDTO {
  Goal toDomain() {
    return Goal(
      id: UniqueId.fromUniqueString(id),
      name: GoalName(name),
      type: type.toDomain(),
      period: period.toDomain(),
      toReach: toReach,
      startDate: GoalStartDate(startDate),
      pledge: pledge.toDomain(),
      endDate: endDate,
    );
  }
}
