// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_actor/goal_actor_bloc.dart';
import 'package:akrasia/domain/goals/goal_step.dart';
import 'package:akrasia/domain/goals/value_objects/goal_data.dart';
import 'package:akrasia/domain/goals/value_objects/goal_data_value.dart';
import 'package:kt_dart/kt.dart';
import '../common/goal_card_data_value.dart';

class YesNoGoalCardDataValue extends GoalCardDataValue {
  const YesNoGoalCardDataValue({GoalStep goalStep}) : super(goalStep: goalStep);

  @override
  Widget buildInProgressDataValue(BuildContext context) {
    final isAchieved = goalStep.isAchieved();
    return ActiveDataValueWidget(
      hasBorder: true,
      fillColor: Colors.green,
      borderColor: Colors.green,
      onPressed: () {
        final KtList<GoalData> data = goalStep.data.size > 0
            ? emptyList()
            : KtList.from([
                GoalData(
                  date: DateTime.now(),
                  value: GoalDataValue.integerData(value: 1),
                ),
              ]);
        context.read<GoalActorBloc>().add(
              GoalActorEvent.stepUpdated(step: goalStep.copyWith(data: data)),
            );
      },
      child: isAchieved ? const Icon(Icons.check) : Container(),
    );
  }
}
