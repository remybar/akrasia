// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/domain/goals/value_objects/goal_time_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';
import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';

class TimerDataConfigurator extends StatefulWidget {
  final GoalType initialType;
  final String title;

  const TimerDataConfigurator({Key key, this.initialType, this.title}) : super(key: key);

  @override
  _CounterDataConfiguratorState createState() => _CounterDataConfiguratorState();
}

class _CounterDataConfiguratorState extends State<TimerDataConfigurator> {
  GoalType currentType;

  @override
  void initState() {
    super.initState();
    currentType = widget.initialType;
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: widget.title,
      onValidate: () {
        context.read<GoalFormBloc>().add(GoalFormEvent.typeChanged(currentType));
        Navigator.pop(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Durée:"),
              NumberPicker.integer(
                zeroPad: true,
                listViewWidth: 70,
                itemExtent: 30,
                initialValue: currentType.whenOrElse(
                  timerGoal: (data) => data.timeValue.getHoursOrCrash(),
                  orElse: (_) => 0,
                ),
                minValue: 0,
                maxValue: 23,
                onChanged: (num value) {
                  setState(() {
                    currentType = currentType.whenOrElse(
                      timerGoal: (data) => data.copyWith(
                        timeValue: GoalTimeValue.from(
                          hours: value.toInt(),
                          minutes: data.timeValue.getMinutesOrCrash(),
                          seconds: data.timeValue.getSecondsOrCrash(),
                        ),
                      ),
                      orElse: (_) => null,
                    );
                  });
                },
              ),
              const Text("h."),
              NumberPicker.integer(
                zeroPad: true,
                listViewWidth: 70,
                itemExtent: 30,
                initialValue: currentType.whenOrElse(
                  timerGoal: (data) => data.timeValue.getMinutesOrCrash(),
                  orElse: (_) => 0,
                ),
                minValue: 0,
                maxValue: 59,
                onChanged: (num value) {
                  setState(() {
                    currentType = currentType.whenOrElse(
                      timerGoal: (data) => data.copyWith(
                        timeValue: GoalTimeValue.from(
                          hours: data.timeValue.getHoursOrCrash(),
                          minutes: value.toInt(),
                          seconds: data.timeValue.getSecondsOrCrash(),
                        ),
                      ),
                      orElse: (_) => null,
                    );
                  });
                },
              ),
              const Text("min."),
              NumberPicker.integer(
                zeroPad: true,
                listViewWidth: 70,
                itemExtent: 30,
                initialValue: currentType.whenOrElse(
                  timerGoal: (data) => data.timeValue.getSecondsOrCrash(),
                  orElse: (_) => 0,
                ),
                minValue: 0,
                maxValue: 59,
                onChanged: (num value) {
                  setState(() {
                    currentType = currentType.whenOrElse(
                      timerGoal: (data) => data.copyWith(
                        timeValue: GoalTimeValue.from(
                          hours: data.timeValue.getHoursOrCrash(),
                          minutes: data.timeValue.getMinutesOrCrash(),
                          seconds: value.toInt(),
                        ),
                      ),
                      orElse: (_) => null,
                    );
                  });
                },
              ),
              const Text("sec."),
            ],
          )
        ],
      ),
    );
  }
}
