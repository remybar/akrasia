import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';

class GoalDateField extends HookWidget {
  const GoalDateField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DateTimeField(
        decoration: InputDecoration(
          labelText: 'Goal start date',
        ),
        format: DateFormat("dd-MM-yyyy"),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: DateTime.now(),
            lastDate: DateTime(2100),
          );
        },
        onChanged: (value) => context.read<GoalFormBloc>().add(GoalFormEvent.startDateChanged(value)),
      ),
    );
  }
}
