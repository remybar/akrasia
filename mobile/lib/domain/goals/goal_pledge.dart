import 'package:super_enum/super_enum.dart';

import 'package:akrasia/domain/goals/goal_pledge_value.dart';

part 'goal_pledge.super.dart';

@superEnum
enum _GoalPledge {
  @object
  // ignore: constant_identifier_names
  NoPledge,

  @Data(fields: [
    DataField<GoalPledgeValue>('start'),
    DataField<GoalPledgeValue>('max'),
  ])
  // ignore: constant_identifier_names
  Pledge,
}

extension GoalPledgeX on GoalPledge {
  static GoalPledge defaultPledge() {
    return GoalPledge.pledge(start: GoalPledgeValue(1), max: GoalPledgeValue(10));
  }
}
