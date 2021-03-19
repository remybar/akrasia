// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';
import 'package:akrasia/domain/goals/value_objects/goal_unit.dart';
import 'package:akrasia/domain/goals/value_objects/goal_value.dart';
import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';

class ManualDataConfigurator extends StatefulWidget {
  final GoalType initialType;
  final String title;

  const ManualDataConfigurator({Key key, this.initialType, this.title}) : super(key: key);

  @override
  _CounterDataConfiguratorState createState() => _CounterDataConfiguratorState();
}

class _CounterDataConfiguratorState extends State<ManualDataConfigurator> {
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
              const Text("Donnée:"),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Valeur",
                    hintStyle: TextStyle(fontSize: 12),
                  ),
                  initialValue: currentType.whenOrElse(
                    valueGoal: (data) => data.value.value.fold(
                      (_) => "",
                      (value) => value.toString(),
                    ),
                    orElse: (_) => "",
                  ),
                  onChanged: (value) {
                    setState(() {
                      currentType = currentType.whenOrElse(
                        valueGoal: (data) => data.copyWith(value: GoalValue(double.parse(value))),
                        orElse: (_) => null,
                      );
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Unité (ex: km, pages...)",
                    hintStyle: TextStyle(fontSize: 12),
                  ),
                  initialValue: currentType.whenOrElse(
                    valueGoal: (data) => data.unit.value.fold(
                      (_) => "",
                      (value) => value,
                    ),
                    orElse: (_) => "",
                  ),
                  onChanged: (value) {
                    setState(() {
                      currentType = currentType.whenOrElse(
                        valueGoal: (data) => data.copyWith(unit: GoalUnit(value)),
                        orElse: (_) => null,
                      );
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
