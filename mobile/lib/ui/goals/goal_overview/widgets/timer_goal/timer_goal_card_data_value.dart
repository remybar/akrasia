// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal_step.dart';
import '../common/goal_card_data_value.dart';

class TimerGoalCardDataValue extends GoalCardDataValue {
  const TimerGoalCardDataValue({GoalStep goalStep}) : super(goalStep: goalStep);

  @override
  Widget buildInProgressDataValue(BuildContext context) {
    return ActiveDataValueWidget(
      hasBorder: true,
      fillColor: Colors.green,
      borderColor: Colors.green,
      onPressed: () {},
      child: const Icon(Icons.play_arrow), // Icon(Icons.pause) si actif
    );
  }
}
