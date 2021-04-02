// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_actor/goal_actor_bloc.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
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
  final GoalStep goalStep;

  const GoalCard({Key key, @required this.goalStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO
//          ExtendedNavigator.of(context).pushGoalFormPage(editedGoal: goalStep);
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
                goalStep.type.when(
                  yesNoGoal: () => YesNoGoalCardDataValue(goalStep: goalStep),
                  countGoal: (_) => CountGoalCardDataValue(goalStep: goalStep),
                  timerGoal: (_) => TimerGoalCardDataValue(goalStep: goalStep),
                  valueGoal: (_) => ValueGoalCardDataValue(goalStep: goalStep),
                ),
                const SizedBox(width: 10),
                goalStep.type.when(
                  yesNoGoal: () => YesNoGoalCardInfo(goalStep: goalStep),
                  countGoal: (_) => CountGoalCardInfo(goalStep: goalStep),
                  timerGoal: (_) => TimerGoalCardInfo(goalStep: goalStep),
                  valueGoal: (_) => ValueGoalCardInfo(goalStep: goalStep),
                ),
                const Spacer(),
                goalStep.type.when(
                  yesNoGoal: () => YesNoGoalCardControl(goalStep: goalStep),
                  countGoal: (_) => CountGoalCardControl(goalStep: goalStep),
                  timerGoal: (_) => TimerGoalCardControl(goalStep: goalStep),
                  valueGoal: (_) => ValueGoalCardControl(goalStep: goalStep),
                ),
                MoreMenuWidget<_ContextMenuChoice>(
                  menuChoices: const {
                    _ContextMenuChoice.pause: "Mettre en pause",
                    _ContextMenuChoice.delete: "Supprimer",
                  },
                  onSelected: (_ContextMenuChoice value) {
                    switch (value) {
                      case _ContextMenuChoice.delete:
                        context.read<GoalActorBloc>().add(GoalActorEvent.deleted(goalId: goalStep.goalId));
                        break;
                      case _ContextMenuChoice.pause:
                        context.read<GoalActorBloc>().add(GoalActorEvent.paused(goalId: goalStep.goalId));
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
