// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal.dart';
import '../common/goal_card_data_value.dart';

class CountGoalCardDataValue extends GoalCardDataValue {
  const CountGoalCardDataValue({Goal goal}) : super(goal: goal);

  @override
  Widget buildInProgressDataValue() {
    return ActiveDataValueWidget(
      icon: const Icon(Icons.add),
      hasBorder: true,
      fillColor: Colors.white,
      borderColor: Colors.green,
      onPressed: () {},
    );
  }
}
