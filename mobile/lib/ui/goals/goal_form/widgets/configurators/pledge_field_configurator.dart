import 'package:flutter/material.dart';

class PledgeFieldConfigurator extends StatefulWidget {
  @override
  _PledgeFieldConfiguratorState createState() => _PledgeFieldConfiguratorState();
}

class _PledgeFieldConfiguratorState extends State<PledgeFieldConfigurator> {
  final List<int> pledgeValues = [0, 1, 2, 5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 100];
  int startingValue;
  int maxValue;

  @override
  void initState() {
    super.initState();
    startingValue = 0;
    maxValue = 0;
  }

  void onStartingValueChanged(int newValue) {
    setState(() {
      startingValue = newValue;
    });
  }

  void onMaxValueChanged(int newValue) {
    setState(() {
      maxValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO compte max list according to selected starting value

    return Column(children: [
      Row(children: [
        Container(child: Text("Valeur de départ:"), width: 120),
        SizedBox(width: 10),
        DropdownButton<int>(
          value: startingValue,
          onChanged: onStartingValueChanged,
          items: pledgeValues.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString() + " €"),
            );
          }).toList(),
        ),
      ]),
      Row(children: [
        Container(child: Text("Valeur plafond:"), width: 120),
        SizedBox(width: 10),
        DropdownButton<int>(
          value: maxValue,
          onChanged: onMaxValueChanged,
          items: pledgeValues.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString() + " €"),
            );
          }).toList(),
        )
      ]),
    ]);
  }
}
