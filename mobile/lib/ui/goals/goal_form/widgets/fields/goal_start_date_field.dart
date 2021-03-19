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

class GoalStartDateField extends HookWidget {
  static const dateYearRange = 10;

  const GoalStartDateField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime initialDate = DateTime.now();

    return BlocListener<GoalFormBloc, GoalFormState>(
      listenWhen: (prev, cur) => prev.isEditing != cur.isEditing || prev.goal.startDate != cur.goal.startDate,
      listener: (context, state) {
        initialDate = state.goal.startDate.getOrCrash();
      },
      child: DateTimeField(
        decoration: const InputDecoration(
          labelText: "Date de départ",
        ),
        format: DateFormat("dd/MM/yyyy"),
        resetIcon: null,
        initialValue: initialDate,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            firstDate: shiftDate(initialDate, year: -dateYearRange),
            initialDate: initialDate,
            lastDate: shiftDate(initialDate, year: dateYearRange),
          );
        },
        onChanged: (value) => context.read<GoalFormBloc>().add(GoalFormEvent.startDateChanged(value)),
        validator: (_) => context.read<GoalFormBloc>().state.goal.startDate.value.fold(
              (f) => f.maybeMap(
                isNull: (_) => "Choisir une date",
                orElse: () => "Erreur inconnue",
              ),
              (_) => null,
            ),
      ),
    );
  }
}
