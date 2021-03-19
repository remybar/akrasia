// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/ui/routes/router.gr.dart';
import './goal_card_body.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;

  const GoalCard({Key key, @required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          ExtendedNavigator.of(context).pushGoalFormPage(editedGoal: goal);
        },
        child: GoalCardBody(goal: goal),
      ),
    );
  }
}
