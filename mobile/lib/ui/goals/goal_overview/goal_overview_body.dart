// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_watcher/goal_watcher_bloc.dart';
import 'goal_overview_failure.dart';
import 'widgets/goal_card.dart';

class GoalOverviewBody extends StatelessWidget {
  final DateTime selectedDate;

  const GoalOverviewBody({Key key, this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalWatcherBloc, GoalWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          initial: (_) => Container(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) {
            return ListView.builder(
              itemCount: state.goals.size,
              itemBuilder: (context, index) {
                final goalState = state.goals[index];
                // TODO: handle invalid goal step
                // if (goal.failureOption.isSome()) {
                //   return GoalCardError(goal: goal);
                // }
                return GoalCard(selectedDate: selectedDate, goalState: goalState);
              },
            );
          },
          loadFailure: (state) {
            return GoalOverviewFailure(failure: state.failure);
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
