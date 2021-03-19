// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:akrasia/domain/goals/value_objects/goal_pledge.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge_value.dart';

part 'goal_pledge_dto.freezed.dart';
part 'goal_pledge_dto.g.dart';

@freezed
abstract class GoalPledgeDTO with _$GoalPledgeDTO {
  const factory GoalPledgeDTO.pledge({
    @required int start,
    @required int max,
  }) = _GoalPledgeYesDTO;
  const factory GoalPledgeDTO.noPledge() = _GoalPledgeNoDTO;

  factory GoalPledgeDTO.fromDomain(GoalPledge pledge) {
    return pledge.when(
      noPledge: () => const GoalPledgeDTO.noPledge(),
      pledge: (data) => GoalPledgeDTO.pledge(
        start: data.start.getOrCrash(),
        max: data.max.getOrCrash(),
      ),
    );
  }

  factory GoalPledgeDTO.fromJson(Map<String, dynamic> json) => _$GoalPledgeDTOFromJson(json);
}

extension GoalPledgeDTOX on GoalPledgeDTO {
  GoalPledge toDomain() {
    if (this is _GoalPledgeYesDTO) {
      final o = this as _GoalPledgeYesDTO;
      return GoalPledge.pledge(
        start: GoalPledgeValue(o.start),
        max: GoalPledgeValue(o.max),
      );
    }
    if (this is _GoalPledgeNoDTO) {
      return GoalPledge.noPledge();
    }
    return null;
  }
}
