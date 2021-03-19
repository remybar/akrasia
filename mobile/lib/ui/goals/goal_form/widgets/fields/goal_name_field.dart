// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/domain/goals/value_objects/goal_name.dart';

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
            labelText: "Nom de l'objectif",
            counterText: "",
          ),
          maxLength: GoalName.maxLength,

          // TODO: input format (not special characters)
          onChanged: (value) => context.read<GoalFormBloc>().add(GoalFormEvent.nameChanged(value)),
          validator: (_) => context.read<GoalFormBloc>().state.goal.name.value.fold(
                (failure) => failure.maybeMap(
                  empty: (f) => "Ne peut pas être vide",
                  exceedingLength: (f) => "Trop long",
                  notAlphaNum: (f) => "Ne doit contenir que des caractères alphanumériques",
                  orElse: () => "Erreur inconnue",
                ),
                (r) => null,
              )),
    );
  }
}
