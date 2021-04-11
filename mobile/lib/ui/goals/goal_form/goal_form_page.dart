// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/domain/goals/goal.dart';
import 'package:akrasia/injection.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/goal_form_widget.dart';
import 'package:akrasia/ui/routes/router.gr.dart';

class GoalFormPage extends StatelessWidget {
  final Goal editedGoal;

  const GoalFormPage({Key key, @required this.editedGoal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GoalFormBloc>(
      create: (context) => getIt<GoalFormBloc>()..add(GoalFormEvent.initialized(optionOf(editedGoal))),
      child: BlocConsumer<GoalFormBloc, GoalFormState>(
        listenWhen: (prev, cur) => prev.goalFailureOrSuccessOption != cur.goalFailureOrSuccessOption,
        listener: (context, state) {
          state.goalFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    message: failure.map(
                      insufficientPermission: (_) => 'Insufficient permission',
                      unexpected: (_) => 'Unexpected failure',
                    ),
                  ).show(context);
                },
                (_) {
                  ExtendedNavigator.of(context).popUntil((route) => route.settings.name == Routes.goalOverviewPage);
                },
              );
            },
          );
        },
        buildWhen: (prev, cur) => prev.isSaving != cur.isSaving,
        builder: (context, state) {
          return Stack(
            children: [
              const GoalFormPageBody(),
              SavingInProgressOverlay(isSaving: state.isSaving),
            ],
          );
        },
      ),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;

  const SavingInProgressOverlay({
    Key key,
    @required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: !isSaving,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Visibility(
              visible: isSaving,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 8),
                  Text(
                    'Saving...',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            )));
  }
}

class GoalFormPageBody extends StatelessWidget {
  const GoalFormPageBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<GoalFormBloc, GoalFormState>(
          buildWhen: (prev, cur) => prev.isEditing != cur.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? 'Editer un objectif' : 'Créer un objectif');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              context.read<GoalFormBloc>().add(const GoalFormEvent.saved());
            },
          )
        ],
      ),
      body: const GoalFormWidget(),
    );
  }
}
