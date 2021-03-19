// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/domain/goals/value_objects/goal_count_value.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';
import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';

class CounterDataConfigurator extends StatefulWidget {
  final GoalType initialType;
  final String title;

  const CounterDataConfigurator({Key key, this.initialType, this.title}) : super(key: key);

  @override
  _CounterDataConfiguratorState createState() => _CounterDataConfiguratorState();
}

class _CounterDataConfiguratorState extends State<CounterDataConfigurator> {
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
              const Text("Valeur:"),
              Flexible(
                  child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: widget.initialType.whenOrElse(
                  countGoal: (data) => data.countValue.getOrElse(null)?.toString(),
                  orElse: (_) => "",
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  setState(() {
                    currentType = currentType.whenOrElse(
                      countGoal: (data) => data.copyWith(countValue: GoalCountValue(int.parse(value))),
                      orElse: (_) => null,
                    );
                  });
                },
              ))
            ],
          )
        ],
      ),
    );
  }
}
