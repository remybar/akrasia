// Flutter imports:
import 'package:akrasia/domain/goals/goal_state.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_actor/goal_actor_bloc.dart';
import 'package:akrasia/ui/akrasia_theme.dart';
import 'package:akrasia/ui/core/widgets/more_menu_widget.dart';
import 'package:akrasia/ui/routes/router.gr.dart';
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

enum _ContextMenuChoice {
  pause,
  delete,
}

class GoalCard extends StatelessWidget {
  final DateTime selectedDate;
  final GoalState goalState;

  const GoalCard({Key key, @required this.goalState, this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO
//          ExtendedNavigator.of(context).pushGoalFormPage(editedGoal: goalState);
        },
        child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.goalCardBgColor,
            ),
            child: Row(
              children: [
                goalState.goal.type.when(
                  yesNoGoal: () => YesNoGoalCardDataValue(selectedDate: selectedDate, goalState: goalState),
                  countGoal: (_) => CountGoalCardDataValue(selectedDate: selectedDate, goalState: goalState),
                  timerGoal: (_) => TimerGoalCardDataValue(selectedDate: selectedDate, goalState: goalState),
                  valueGoal: (_) => ValueGoalCardDataValue(selectedDate: selectedDate, goalState: goalState),
                ),
                const SizedBox(width: 10),
                goalState.goal.type.when(
                  yesNoGoal: () => YesNoGoalCardInfo(goalState: goalState),
                  countGoal: (_) => CountGoalCardInfo(goalState: goalState),
                  timerGoal: (_) => TimerGoalCardInfo(goalState: goalState),
                  valueGoal: (_) => ValueGoalCardInfo(goalState: goalState),
                ),
                const Spacer(),
                goalState.goal.type.when(
                  yesNoGoal: () => YesNoGoalCardControl(goalState: goalState),
                  countGoal: (_) => CountGoalCardControl(goalState: goalState),
                  timerGoal: (_) => TimerGoalCardControl(goalState: goalState),
                  valueGoal: (_) => ValueGoalCardControl(goalState: goalState),
                ),
                MoreMenuWidget<_ContextMenuChoice>(
                  menuChoices: const {
                    _ContextMenuChoice.pause: "Mettre en pause",
                    _ContextMenuChoice.delete: "Supprimer",
                  },
                  onSelected: (_ContextMenuChoice value) {
                    switch (value) {
                      case _ContextMenuChoice.delete:
                        context.read<GoalActorBloc>().add(GoalActorEvent.deleted(goalId: goalState.goal.id));
                        break;
                      case _ContextMenuChoice.pause:
                        context.read<GoalActorBloc>().add(GoalActorEvent.paused(goalId: goalState.goal.id));
                        break;
                      default:
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
