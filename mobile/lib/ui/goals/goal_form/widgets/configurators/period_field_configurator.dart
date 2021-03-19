// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:weekday_selector/weekday_selector.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period.dart';
import 'package:akrasia/domain/goals/value_objects/goal_period_count.dart';
import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/misc/utils.dart';

enum UIPeriodType {
  everyPeriod,
  onPeriod,
}

class PeriodFieldConfigurator extends StatefulWidget {
  final GoalPeriod initialPeriod;

  const PeriodFieldConfigurator({Key key, this.initialPeriod}) : super(key: key);

  @override
  _PeriodFieldConfiguratorState createState() => _PeriodFieldConfiguratorState();
}

class _PeriodFieldConfiguratorState extends State<PeriodFieldConfigurator> {
  static const defaultShortWeekdays = <String>["D", "L", "M", "M", "J", "V", "S"];
  GoalPeriod currentPeriod;

  @override
  void initState() {
    super.initState();
    currentPeriod = widget.initialPeriod;
  }

  Widget _buildEveryPeriodSelector(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Radio<UIPeriodType>(
              value: UIPeriodType.everyPeriod,
              groupValue: currentPeriod.when(
                every: (_) => UIPeriodType.everyPeriod,
                onDay: (_) => UIPeriodType.onPeriod,
              ),
              onChanged: (type) {
                setState(() {
                  currentPeriod = GoalPeriodX.defaultEvery();
                });
              },
            ),
            const Text("Chaque"),
          ],
        ),
        const Spacer(),
        DropdownButton<int>(
          value: currentPeriod.when(
            every: (data) => data.count.getOrCrash(),
            onDay: (_) => null,
          ),
          onChanged: currentPeriod.when(
            every: (data) => (value) {
              setState(() {
                currentPeriod = GoalPeriod.every(
                  count: GoalPeriodCount(value),
                  kind: data.kind,
                );
              });
            },
            onDay: (_) => null,
          ),
          items: List<int>.generate(
            GoalPeriodCount.maxValue,
            (int index) => index + 1,
          ).map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ),
        const SizedBox(width: 10),
        DropdownButton<GoalPeriodKind>(
          value: currentPeriod.when(
            every: (data) => data.kind,
            onDay: (_) => null,
          ),
          onChanged: currentPeriod.when(
            every: (data) => (value) {
              setState(() {
                currentPeriod = GoalPeriod.every(
                  count: data.count,
                  kind: value,
                );
              });
            },
            onDay: (_) => null,
          ),
          items: GoalPeriodKind.values.map((GoalPeriodKind value) {
            return DropdownMenuItem<GoalPeriodKind>(
              value: value,
              child: Text(kindToString(value)),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildOnPeriodSelector(BuildContext context) {
    return BlocBuilder<GoalFormBloc, GoalFormState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Radio<UIPeriodType>(
                  value: UIPeriodType.onPeriod,
                  groupValue: currentPeriod.when(
                    every: (_) => UIPeriodType.everyPeriod,
                    onDay: (_) => UIPeriodType.onPeriod,
                  ),
                  onChanged: (type) {
                    setState(() {
                      currentPeriod = GoalPeriodX.defaultOn();
                    });
                  },
                ),
                const Text("Sélectionner les jours de la semaine"),
              ],
            ),
            WeekdaySelector(
              shortWeekdays: defaultShortWeekdays,
              selectedColor: Colors.white,
              selectedFillColor: Theme.of(context).primaryColor,
              onChanged: (int day) {
                currentPeriod.when(
                  every: (_) => null,
                  onDay: (data) {
                    setState(() {
                      currentPeriod = GoalPeriod.onDay(
                          weekdays: data.weekdays.mapIndexed((index, value) => index == (day % 7) ? !value : value));
                    });
                  },
                );
              },
              values: currentPeriod.when(
                every: (_) => List<bool>.filled(7, null),
                onDay: (data) => data.weekdays.asList(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'Period',
      onValidate: () {
        context.read<GoalFormBloc>().add(
              GoalFormEvent.periodChanged(currentPeriod),
            );
        Navigator.pop(context);
      },
      child: Column(
        children: [
          _buildEveryPeriodSelector(context),
          _buildOnPeriodSelector(context),
        ],
      ),
    );
  }
}
