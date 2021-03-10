import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:akrasia/core/misc/utils.dart';
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';

class GoalEndDateField extends HookWidget {
  static const dateYearRange = 10;

  const GoalEndDateField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      decoration: InputDecoration(
        labelText: 'Goal end date',
      ),
      format: DateFormat("dd-MM-yyyy"),
      onShowPicker: (context, currentValue) {
        final startDate = context.read<GoalFormBloc>().state.goal.startDate;
        final endDate = context.read<GoalFormBloc>().state.goal.endDate;
        final now = DateTime.now();
        return showDatePicker(
          context: context,
          firstDate: startDate ?? shiftDate(endDate ?? now, year: -dateYearRange),
          initialDate: endDate ?? startDate ?? now,
          lastDate: shiftDate(endDate ?? startDate ?? now, year: dateYearRange),
        );
      },
      onChanged: (value) => context.read<GoalFormBloc>().add(GoalFormEvent.endDateChanged(value)),
      validator: (_) => null,
    );
  }
}
