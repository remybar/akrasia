import 'package:akrasia/domain/goals/goal_failure.dart';
import 'package:flutter/material.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final GoalFailure failure;

  const CriticalFailureDisplay({Key key, @required this.failure}) : super(key: key);

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
