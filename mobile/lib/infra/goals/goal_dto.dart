import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/domain/goals/goal_name.dart';

part 'goal_dto.freezed.dart';
part 'goal_dto.g.dart';

@freezed
abstract class GoalDTO with _$GoalDTO {
  factory GoalDTO({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required bool toReach,
  }) = _GoalDTO;

  factory GoalDTO.fromDomain(Goal goal) {
    return GoalDTO(
      id: goal.id.getOrCrash(),
      name: goal.name.getOrCrash(),
      toReach: goal.toReach,
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
      toReach: toReach,
    );
  }
}
