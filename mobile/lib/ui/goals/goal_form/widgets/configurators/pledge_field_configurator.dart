// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge.dart';
import 'package:akrasia/domain/goals/value_objects/goal_pledge_value.dart';
import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';

class PledgeFieldConfigurator extends StatefulWidget {
  final GoalPledge initialPledge;

  const PledgeFieldConfigurator({Key key, this.initialPledge}) : super(key: key);

  @override
  _PledgeFieldConfiguratorState createState() => _PledgeFieldConfiguratorState();
}

class _PledgeFieldConfiguratorState extends State<PledgeFieldConfigurator> {
  GoalPledge currentPledge;

  @override
  void initState() {
    super.initState();
    currentPledge = widget.initialPledge;
  }

  Widget _buildWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Gage: "),
            Switch(
                value: currentPledge.when(
                  noPledge: () => false,
                  pledge: (_) => true,
                ),
                onChanged: (value) {
                  setState(() {
                    currentPledge = value ? GoalPledgeX.defaultPledge() : GoalPledge.noPledge();
                  });
                }),
          ],
        ),
        if (currentPledge.whenOrElse(noPledge: () => false, orElse: (_) => true))
          Column(
            children: [
              Row(children: [
                const Text("Valeur de départ:"),
                const SizedBox(width: 10),
                DropdownButton<int>(
                  value: currentPledge.when(
                    noPledge: () => null,
                    pledge: (data) => data.start.getOrCrash(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      currentPledge = currentPledge.when(
                        noPledge: () => null,
                        pledge: (data) => GoalPledge.pledge(
                          start: GoalPledgeValue(value),
                          max: data.max,
                        ),
                      );
                    });
                  },
                  items: GoalPledgeValue.acceptedValues.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text("$value€"),
                    );
                  }).toList(),
                ),
              ]),
              // TODO: be sure that the maximal value is not strictly lower than the start value
              Row(
                children: [
                  const Text("Valeur maximale:"),
                  const SizedBox(width: 10),
                  DropdownButton<int>(
                    value: currentPledge.when(
                      noPledge: () => null,
                      pledge: (data) => data.max.getOrCrash(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        currentPledge = currentPledge.when(
                          noPledge: () => null,
                          pledge: (data) => GoalPledge.pledge(
                            start: data.start,
                            max: GoalPledgeValue(value),
                          ),
                        );
                      });
                    },
                    items: GoalPledgeValue.acceptedValues.map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text("$value€"),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
        title: 'Pledge',
        onValidate: () {
          context.read<GoalFormBloc>().add(
                GoalFormEvent.pledgeChanged(currentPledge),
              );
          Navigator.pop(context);
        },
        child: _buildWidget(context));
  }
}
