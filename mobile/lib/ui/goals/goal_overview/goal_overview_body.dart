// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_watcher/goal_watcher_bloc.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'goal_overview_failure.dart';
import 'widgets/goal_card.dart';
import 'widgets/goal_card_error.dart';

class GoalOverviewBody extends StatelessWidget {
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
                  return GoalCardError(goal: goal);
                }
                return GoalCard(goal: goal);
              },
            );
          },
          loadFailure: (state) {
            return GoalOverviewFailure(failure: state.failure);
          },
        );
      },
    );
  }
}
