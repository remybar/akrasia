import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';
//import 'package:akrasia/ui/goals/goal_form/widgets/configurators/period_field_configurator.dart';

class GoalPeriodField extends HookWidget {
  const GoalPeriodField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<GoalFormBloc, GoalFormState>(
        listenWhen: (prev, cur) => prev.isEditing != cur.isEditing,
        listener: (context, state) {
          textEditingController.text = state.goal.period.toString();
        },
        child: TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: 'Goal Period',
            ),
            readOnly: true,
            onTap: () {
              showCustomBottomSheet(
                title: 'Period',
                context: context,
                child: Text('TODO'), //PeriodFieldConfigurator(),
              );
            }));
  }
}
