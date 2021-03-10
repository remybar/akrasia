import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:akrasia/ui/goals/goal_form/widgets/fields/value_type_field.dart';

class TimerDataConfigurator extends StatefulWidget {
  @override
  _TimerDataConfiguratorState createState() => _TimerDataConfiguratorState();
}

class _TimerDataConfiguratorState extends State<TimerDataConfigurator> {
  int _currentHours = 0;
  int _currentMinutes = 0;
  int _currentSeconds = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueTypeField(),
        Row(
          children: [
            Text("Durée:"),
            NumberPicker.integer(
              zeroPad: true,
              listViewWidth: 70,
              itemExtent: 30,
              initialValue: _currentHours,
              minValue: 0,
              maxValue: 23,
              onChanged: (num value) {
                setState(() {
                  _currentHours = value;
                });
              },
            ),
            Text("h."),
            NumberPicker.integer(
              zeroPad: true,
              listViewWidth: 70,
              itemExtent: 30,
              initialValue: _currentMinutes,
              minValue: 0,
              maxValue: 59,
              onChanged: (num value) {
                setState(() {
                  _currentMinutes = value;
                });
              },
            ),
            Text("min."),
            NumberPicker.integer(
              zeroPad: true,
              listViewWidth: 70,
              itemExtent: 30,
              initialValue: _currentSeconds,
              minValue: 0,
              maxValue: 59,
              onChanged: (num value) {
                setState(() {
                  _currentSeconds = value;
                });
              },
            ),
            Text("sec."),
          ],
        )
      ],
    );
  }
}
