import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/fields/goal_name_field.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/fields/goal_start_date_field.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/fields/goal_end_date_field.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/fields/goal_period_field.dart';

import 'package:akrasia/ui/goals/goal_form/widgets/fields/goal_data_field.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/fields/goal_reminder_field.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/fields/goal_pledge_field.dart';

class GoalFormWidget extends StatelessWidget {
  const GoalFormWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalFormBloc, GoalFormState>(
      buildWhen: (prev, cur) => prev.showErrorMessages != cur.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const GoalNameField(),
                GoalDataField(),
                const GoalPeriodField(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Flexible(child: GoalStartDateField()),
                    SizedBox(width: 10),
                    Flexible(child: GoalEndDateField()),
                  ],
                ),
                GoalPledgeField(),
                GoalReminderField(),
              ],
            ),
          ),
        );
      },
    );
  }
}
