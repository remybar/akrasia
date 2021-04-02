// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/core/misc/utils.dart';

class GoalEndDateField extends HookWidget {
  static const dateYearRange = 10;

  const GoalEndDateField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalFormBloc, GoalFormState>(
      buildWhen: (prev, cur) {
        return prev.isEditing != cur.isEditing ||
            (prev.goal.endDate != cur.goal.endDate) ||
            (prev.goal.startDate != cur.goal.startDate);
      },
      builder: (context, state) {
        final endDate = state.goal.endDate?.value;
        final startDate = state.goal.startDate.getOrCrash();
        return DateTimeField(
          decoration: const InputDecoration(
            labelText: "Date de fin",
          ),
          format: DateFormat("dd/MM/yyyy"),
          initialValue: endDate,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
              context: context,
              firstDate: startDate,
              initialDate: endDate ?? startDate,
              lastDate: shiftDate(startDate, year: dateYearRange),
            );
          },
          onChanged: (value) {
            (value == null)
                ? context.read<GoalFormBloc>().add(const GoalFormEvent.endDateRemoved())
                : context.read<GoalFormBloc>().add(GoalFormEvent.endDateChanged(value));
          },
          validator: (_) => null,
        );
      },
    );
  }
}
