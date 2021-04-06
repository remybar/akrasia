// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:akrasia/ui/core/widgets/tag_widget.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/misc/utils.dart';

class GoalCardInfo extends StatelessWidget {
  final GoalStep goalStep;

  // TODO: move theme stuff in the Theme
  final Color backgroundColor = Colors.blueGrey[50];

  GoalCardInfo({Key key, this.goalStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = goalStep.goal.name.getOrCrash();
    final String period = periodToString(goalStep.goal.period);
    final String prefix = goalStep.goal.toReach ? "min. " : "max. ";
    final subtitle = goalStep.goal.type.when(
      yesNoGoal: () => period,
      countGoal: (data) => "$prefix ${data.countValue.getOrCrash()} fois · $period",
      timerGoal: (data) => "$prefix ${data.timeValue.getOrCrash()} · $period",
      valueGoal: (data) => "$prefix ${data.value.getOrCrash()} ${data.unit.getOrCrash()} · $period",
    );
    final hasPledge = goalStep.pledge != null;
    final currentPledge = hasPledge ? "${goalStep.pledge}€" : "";
    const isInProgress = true; // TODO

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: isInProgress ? Colors.black : Colors.black54,
                ),
              ),
              if (hasPledge)
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TagWidget(
                    text: currentPledge,
                    bgColor: backgroundColor,
                    fgColor: isInProgress ? Colors.deepPurple : Colors.black54,
                    fontSize: 10,
                  ),
                )
            ],
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: isInProgress ? Colors.black87 : Colors.black54, fontSize: 12),
        ),
      ],
    );
  }
}
