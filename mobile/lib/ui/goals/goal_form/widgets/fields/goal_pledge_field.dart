// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/configurators.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/pledge_field_configurator.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/misc/utils.dart';

class GoalPledgeField extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController(
      text: pledgeToString(context.read<GoalFormBloc>().state.goal.pledge),
    );

    return BlocListener<GoalFormBloc, GoalFormState>(
      listenWhen: (prev, cur) => prev.isEditing != cur.isEditing || prev.goal.pledge != cur.goal.pledge,
      listener: (context, state) {
        textEditingController.text = pledgeToString(context.read<GoalFormBloc>().state.goal.pledge);
      },
      child: TextFormField(
        controller: textEditingController,
        decoration: const InputDecoration(
          labelText: "Gage",
        ),
        readOnly: true,
        onTap: () {
          showConfigurator<GoalFormBloc>(
            context: context,
            value: BlocProvider.of<GoalFormBloc>(context),
            child: PledgeFieldConfigurator(
              initialPledge: context.read<GoalFormBloc>().state.goal.pledge,
            ),
          );
        },
      ),
    );
  }
}
