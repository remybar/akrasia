// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_actor/goal_actor_bloc.dart';
import 'package:akrasia/domain/goals/goal_state.dart';
import 'package:akrasia/ui/akrasia_theme.dart';
import 'package:akrasia/ui/core/widgets/more_menu_widget.dart';
import 'package:akrasia/ui/routes/router.gr.dart';

enum _ContextMenuChoice {
  pause,
  delete,
}

// a goal card displays all the info of a goal.
// It is composed of 4 areas:
// - "data control" to have some controls on current goal data according to the goal type (play/pause, check, ...)
// - "goal info" to display general information about the goal
// - "data display" to be able to display the actual goal data status
// - a "more" contextual menu
abstract class GoalCard extends StatelessWidget {
  final GoalState goalState;

  const GoalCard({Key key, @required this.goalState}) : super(key: key);

  Widget _buildDataControl();

  Widget _buildGoalInfo();

  Widget _buildDataDisplay();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          ExtendedNavigator.of(context).pushGoalFormPage(editedGoal: goalState.goal);
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
                _buildDataControl(),
                const SizedBox(width: 10),
                _buildGoalInfo(),
                const Spacer(),
                _buildDataDisplay(),
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
