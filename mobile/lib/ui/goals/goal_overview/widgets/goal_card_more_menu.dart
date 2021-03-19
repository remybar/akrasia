// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_actor/goal_actor_bloc.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/ui/core/widgets/more_menu_widget.dart';

enum ContextMenuChoice {
  pause,
  delete,
}

class GoalCardMoreMenu extends StatelessWidget {
  final Goal goal;

  const GoalCardMoreMenu({Key key, this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoreMenuWidget<ContextMenuChoice>(
      menuChoices: const {
        ContextMenuChoice.pause: "Mettre en pause",
        ContextMenuChoice.delete: "Supprimer",
      },
      onSelected: (ContextMenuChoice value) {
        switch (value) {
          case ContextMenuChoice.delete:
            context.read<GoalActorBloc>().add(GoalActorEvent.deleted(goal: goal));
            break;
          case ContextMenuChoice.pause:
            context.read<GoalActorBloc>().add(GoalActorEvent.paused(goal: goal));
            break;
          default:
        }
      },
    );
  }
}
