import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:akrasia/core/misc/utils.dart';
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';

class GoalStartDateField extends HookWidget {
  static const dateYearRange = 10;

  const GoalStartDateField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      decoration: InputDecoration(
        labelText: 'Goal start date',
      ),
      format: DateFormat("dd-MM-yyyy"),
      onShowPicker: (context, currentValue) {
        final initialDate = context.read<GoalFormBloc>().state.goal.startDate ?? DateTime.now();
        return showDatePicker(
          context: context,
          firstDate: shiftDate(initialDate, year: -dateYearRange),
          initialDate: initialDate,
          lastDate: shiftDate(initialDate, year: dateYearRange),
        );
      },
      onChanged: (value) => context.read<GoalFormBloc>().add(GoalFormEvent.startDateChanged(value)),
      validator: (_) => null,
    );
  }
}
