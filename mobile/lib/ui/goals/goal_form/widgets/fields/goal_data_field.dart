// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/configurators.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/data_field_configurator.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/misc/utils.dart';

class GoalDataField extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController(
      text: typeToString(
        context.read<GoalFormBloc>().state.goal.type,
        toReach: context.read<GoalFormBloc>().state.goal.toReach,
      ),
    );

    return BlocListener<GoalFormBloc, GoalFormState>(
      listenWhen: (prev, cur) => prev.isEditing != cur.isEditing || prev.goal.type != cur.goal.type,
      listener: (context, state) {
        textEditingController.text = typeToString(
          context.read<GoalFormBloc>().state.goal.type,
          toReach: context.read<GoalFormBloc>().state.goal.toReach,
        );
      },
      child: TextFormField(
        controller: textEditingController,
        decoration: const InputDecoration(
          labelText: "Données",
        ),
        readOnly: true,
        onTap: () {
          showConfigurator<GoalFormBloc>(
            context: context,
            value: BlocProvider.of<GoalFormBloc>(context),
            child: DataFieldConfigurator(
              initialType: context.read<GoalFormBloc>().state.goal.type,
              toReach: context.read<GoalFormBloc>().state.goal.toReach,
            ),
          );
        },
      ),
    );
  }
}
