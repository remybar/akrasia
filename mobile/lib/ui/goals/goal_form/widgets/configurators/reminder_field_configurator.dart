import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ReminderFieldConfigurator extends StatelessWidget {
  final TimeOfDay initialTime;

  ReminderFieldConfigurator({this.initialTime});

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    return DateTimeField(
        decoration: InputDecoration(
          labelText: "Rappel",
        ),
        format: DateFormat("HH:mm"),
        initialValue: DateTime(now.year, now.month, now.day, initialTime.hour, initialTime.minute),
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: initialTime ?? TimeOfDay.fromDateTime(DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
        onChanged: (DateTime date) {});
  }
}
