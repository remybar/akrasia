import 'package:flutter/material.dart';

import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/reminder_field_configurator.dart';

class GoalReminderField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "à 9:00",
      readOnly: true,
      decoration: const InputDecoration(
        labelText: 'Rappel',
      ),
      onTap: () {
        showCustomBottomSheet(
            title: "Rappel",
            child: ReminderFieldConfigurator(initialTime: TimeOfDay(hour: 9, minute: 0)),
            context: context,
            onValidate: () {});
      },
    );
  }
}
