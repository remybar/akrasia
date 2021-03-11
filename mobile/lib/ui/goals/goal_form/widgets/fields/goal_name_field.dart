import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:akrasia/domain/goals/goal_name.dart';
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';

class GoalNameField extends HookWidget {
  const GoalNameField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<GoalFormBloc, GoalFormState>(
      listenWhen: (prev, cur) => prev.isEditing != cur.isEditing,
      listener: (context, state) {
        textEditingController.text = state.goal.name.getOrCrash();
      },
      child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'Goal name',
            counterText: "",
          ),
          maxLength: GoalName.maxLength,

          // TODO: input format (not special characters)
          onChanged: (value) => context.read<GoalFormBloc>().add(GoalFormEvent.nameChanged(value)),
          validator: (_) => context.read<GoalFormBloc>().state.goal.name.value.fold(
                (failure) => failure.maybeMap(
                  empty: (f) => 'Cannot be empty',
                  exceedingLength: (f) => 'Exceeding length',
                  notAlphaNum: (f) => 'Not alphanum string',
                  orElse: () => 'Unknown error',
                ),
                (r) => null,
              )),
    );
  }
}
