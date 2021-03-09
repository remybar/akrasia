import 'package:akrasia/ui/goals/goal_form/widgets/goal_date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/goal_name_field.dart';

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
            child: Column(
              children: [
                GoalNameField(),
                GoalDateField(),
                GoalDateField(),
              ],
            ),
          ),
        );
      },
    );
  }
}
