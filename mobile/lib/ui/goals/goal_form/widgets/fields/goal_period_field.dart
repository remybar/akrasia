import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/period_field_configurator.dart';
import 'package:akrasia/domain/goals/goal_period.dart';

class GoalPeriodField extends HookWidget {
  const GoalPeriodField({
    Key key,
  }) : super(key: key);

  // TODO: clean conversion
  static String periodToString(GoalPeriod period) {
    return period.when(
      every: (p) => "Every ${p.count.getOrCrash()} ${p.kind}",
      onDay: (p) => "On TODO", // X, Y, Z ou All except X, Y or week-ends, week days w/o week-ends, ...
    );
  }

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController(
      text: periodToString(context.read<GoalFormBloc>().state.goal.period),
    );
    return BlocListener<GoalFormBloc, GoalFormState>(
      listenWhen: (prev, cur) => prev.isEditing != cur.isEditing || prev.goal.period != cur.goal.period,
      listener: (context, state) {
        textEditingController.text = periodToString(state.goal.period);
      },
      child: TextFormField(
        controller: textEditingController,
        decoration: const InputDecoration(
          labelText: 'Goal Period',
        ),
        readOnly: true,
        onTap: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              builder: (BuildContext bc) {
                return BlocProvider<GoalFormBloc>.value(
                  value: BlocProvider.of<GoalFormBloc>(context),
                  child: PeriodFieldConfigurator(
                    initialPeriod: context.read<GoalFormBloc>().state.goal.period,
                  ),
                );
              });
        },
      ),
    );
  }
}
