// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal_state.dart';
import '../common/goal_card_data_value.dart';

class ValueGoalCardDataValue extends GoalCardDataValue {
  const ValueGoalCardDataValue({GoalState goalState, DateTime selectedDate})
      : super(goalState: goalState, selectedDate: selectedDate);

  @override
  Widget buildInProgressDataValue(BuildContext context) {
    return ActiveDataValueWidget(
      hasBorder: false,
      fillColor: Colors.blueGrey[600],
      borderColor: Colors.blueGrey[600],
      onPressed: () {},
      child: const Icon(Icons.edit),
    );
  }
}
