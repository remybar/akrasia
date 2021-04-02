// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal.dart';

class GoalCardError extends StatelessWidget {
  final Goal goal;

  const GoalCardError({Key key, @required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Column(
        children: [
          const Text("Impossible de charger cet objectif. Veuillez contacter le support."),
          Text(
            goal.failureOption.fold(
              () => '',
              (f) => f.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
