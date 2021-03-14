import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:akrasia/domain/goals/goal_pledge.dart';

part 'goal_pledge_dto.freezed.dart';
part 'goal_pledge_dto.g.dart';

@freezed
abstract class GoalPledgeDTO with _$GoalPledgeDTO {
  const factory GoalPledgeDTO(
    String name,
  ) = _GoalPledgeDTO;

  // ignore: avoid_unused_constructor_parameters
  factory GoalPledgeDTO.fromDomain(GoalPledge goalPledge) {
    //TODO
    return const GoalPledgeDTO("TODO");
  }

  factory GoalPledgeDTO.fromJson(Map<String, dynamic> json) => _$GoalPledgeDTOFromJson(json);
}

extension GoalPeriodDTOX on GoalPledgeDTO {
  GoalPledge toDomain() {
    return GoalPledge.noPledge();
    //TODO
  }
}
