import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

enum RepeatKind { RepeatEvery, RepeatOn }

class PeriodFieldConfigurator extends StatefulWidget {
  @override
  _PeriodFieldConfiguratorState createState() => _PeriodFieldConfiguratorState();
}

class _PeriodFieldConfiguratorState extends State<PeriodFieldConfigurator> {
  final periodNames = ["jour", "semaine", "mois"];
  final defaultShortWeekdays = <String>["D", "L", "M", "M", "J", "V", "S"];

  final periodCounts = List<int>.generate(30, (int index) => index + 1);

  RepeatKind selectedKind;
  String periodName;
  int periodCount;
  List<bool> dowSelected = List.filled(7, true);

  void setSelectedRadio(RepeatKind val) {
    setState(() {
      selectedKind = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedKind = RepeatKind.RepeatEvery;
    periodCount = periodCounts[0];
    periodName = periodNames[0];
  }

  Widget _buildPeriodCountWidget(BuildContext context, bool enabled) {
    return DropdownButton<int>(
      value: periodCount,
      disabledHint: Text(periodCount.toString()),
      onChanged: enabled
          ? (int newValue) {
              setState(() {
                periodCount = newValue;
              });
            }
          : null,
      items: periodCounts.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }

  Widget _buildPeriodNameWidget(BuildContext context, bool enabled) {
    return DropdownButton<String>(
      value: periodName,
      disabledHint: Text(periodName),
      onChanged: enabled
          ? (String newValue) {
              setState(() {
                periodName = newValue;
              });
            }
          : null,
      items: periodNames.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildRepeatEvery(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Radio<RepeatKind>(
          value: RepeatKind.RepeatEvery,
          groupValue: selectedKind,
          onChanged: setSelectedRadio,
        ),
        Text("Chaque"),
      ]),
      Spacer(),
      _buildPeriodCountWidget(context, selectedKind == RepeatKind.RepeatEvery),
      SizedBox(width: 10),
      _buildPeriodNameWidget(context, selectedKind == RepeatKind.RepeatEvery),
    ]);
  }

  Widget _buildRepeatOn(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Radio<RepeatKind>(
          value: RepeatKind.RepeatOn,
          groupValue: selectedKind,
          onChanged: setSelectedRadio,
        ),
        Text("Sélectionner les jours de la semaine"),
      ]),
      WeekdaySelector(
        shortWeekdays: defaultShortWeekdays,
        selectedColor: Colors.white,
        selectedFillColor: Theme.of(context).primaryColor,
        onChanged: (int day) {
          setState(() {
            final index = day % 7;
            dowSelected[index] = !dowSelected[index];
          });
        },
        values: (selectedKind == RepeatKind.RepeatOn) ? dowSelected : List.filled(7, null),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildRepeatEvery(context),
      _buildRepeatOn(context),
    ]);
  }
}
