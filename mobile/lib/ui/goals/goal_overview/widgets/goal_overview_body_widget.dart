import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/application/goals/goal_watcher/goal_watcher_bloc.dart';
import 'package:akrasia/ui/goals/goal_overview/widgets/critical_failure_display.dart';
import 'package:akrasia/ui/goals/goal_overview/widgets/goal_card.dart';
import 'package:akrasia/ui/goals/goal_overview/widgets/erroneous_goal_card.dart';

class GoalOverviewBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalWatcherBloc, GoalWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) {
            return ListView.builder(
              itemCount: state.goals.size,
              itemBuilder: (context, index) {
                final goal = state.goals[index];
                if (goal.failureOption.isSome()) {
                  return ErroneousGoalCard(goal: goal);
                }
                return GoalCard(goal: goal);
              },
            );
          },
          loadFailure: (state) {
            return CriticalFailureDisplay(failure: state.failure);
          },
        );
      },
    );
  }
}
