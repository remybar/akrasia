import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_name.dart';
import 'package:akrasia/domain/goals/goal_date.dart';
import 'package:akrasia/domain/goals/goal_period.dart';

import 'package:akrasia/infra/goals/goal_type_dto.dart';

part 'goal_dto.freezed.dart';
part 'goal_dto.g.dart';

@freezed
abstract class GoalDTO implements _$GoalDTO {
  factory GoalDTO({
    @JsonKey(ignore: true)
        String id,
    @required
        String name,
    @required
        bool toReach,
    @required
        GoalTypeDTO type,
    @JsonKey(
      fromJson: GoalDTO._strToPeriod,
      toJson: GoalDTO._periodToStr,
    )
    @required
        GoalPeriod period,
    @required
        DateTime startDate,
    DateTime endDate,
    int startPledge,
    int endPledge,
    DateTime startPause,
    DateTime endPause,
  }) = _GoalDTO;

  factory GoalDTO.fromDomain(Goal goal) {
    return GoalDTO(
      id: goal.id.getOrCrash(),
      name: goal.name.getOrCrash(),
      type: GoalTypeDTO.fromDomain(goal.type),
      period: goal.period,
      toReach: goal.toReach,
      startDate: goal.startDate.getOrCrash(),
      // endDate: goal.endDate?.getOrCrash(),
    );
  }

  factory GoalDTO.fromJson(Map<String, dynamic> json) => _$GoalDTOFromJson(json);

  factory GoalDTO.fromFirestore(DocumentSnapshot document) {
    return GoalDTO.fromJson(document.data()).copyWith(id: document.id);
  }

  static GoalPeriod _strToPeriod(String value) {
    switch (value) {
      case "week":
        return GoalPeriod.every_week;
      case "day":
        return GoalPeriod.every_day;
    }
    return null;
  }

  static String _periodToStr(GoalPeriod value) {
    switch (value) {
      case GoalPeriod.every_week:
        return "week";
      case GoalPeriod.every_day:
        return "day";
    }
    return null;
  }
}

extension GoalDTOX on GoalDTO {
  Goal toDomain() {
    return Goal(
      id: UniqueId.fromUniqueString(id),
      name: GoalName(name),
      type: type.toDomain(),
      period: period,
      toReach: toReach,
      startDate: GoalDate(startDate),
//      endDate: GoalDate(endDate),
    );
  }
}
