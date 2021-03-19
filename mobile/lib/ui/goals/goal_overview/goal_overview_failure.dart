// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal_failure.dart';

class GoalOverviewFailure extends StatelessWidget {
  final GoalFailure failure;

  const GoalOverviewFailure({Key key, @required this.failure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Text(
        "😱",
        style: TextStyle(fontSize: 100),
      ),
      Text(failure.maybeMap(
        insufficientPermission: (_) => 'Insufficient permission',
        orElse: () => 'Unexpected',
      ))
    ]));
  }
}
