// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/ui/goals/goal_overview/widgets/goal_card_more_menu.dart';
import 'count_goal/count_goal_card_control.dart';
import 'count_goal/count_goal_card_data_value.dart';
import 'count_goal/count_goal_card_info.dart';
import 'timer_goal/timer_goal_card_control.dart';
import 'timer_goal/timer_goal_card_data_value.dart';
import 'timer_goal/timer_goal_card_info.dart';
import 'value_goal/value_goal_card_control.dart';
import 'value_goal/value_goal_card_data_value.dart';
import 'value_goal/value_goal_card_info.dart';
import 'yesno_goal/yesno_goal_card_control.dart';
import 'yesno_goal/yesno_goal_card_data_value.dart';
import 'yesno_goal/yesno_goal_card_info.dart';

/// The goal card body is composed of 4 areas:
/// - data value
/// - goal info
/// - data control
/// - more menu
class GoalCardBody extends StatelessWidget {
  // TODO: move theme stuff in the Theme
  final Color backgroundColor = Colors.blueGrey[50];

  final Goal goal;

  GoalCardBody({Key key, this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            goal.type.when(
              yesNoGoal: () => YesNoGoalCardDataValue(goal: goal),
              countGoal: (_) => CountGoalCardDataValue(goal: goal),
              timerGoal: (_) => TimerGoalCardDataValue(goal: goal),
              valueGoal: (_) => ValueGoalCardDataValue(goal: goal),
            ),
            const SizedBox(width: 10),
            goal.type.when(
              yesNoGoal: () => YesNoGoalCardInfo(goal: goal),
              countGoal: (_) => CountGoalCardInfo(goal: goal),
              timerGoal: (_) => TimerGoalCardInfo(goal: goal),
              valueGoal: (_) => ValueGoalCardInfo(goal: goal),
            ),
            const Spacer(),
            goal.type.when(
              yesNoGoal: () => YesNoGoalCardControl(goal: goal),
              countGoal: (_) => CountGoalCardControl(goal: goal),
              timerGoal: (_) => TimerGoalCardControl(goal: goal),
              valueGoal: (_) => ValueGoalCardControl(goal: goal),
            ),
            GoalCardMoreMenu(goal: goal),
          ],
        ));
  }
}
