import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:akrasia/application/auth/auth_bloc.dart';
import 'package:akrasia/application/goals/goal_watcher/goal_watcher_bloc.dart';
import 'package:akrasia/application/goals/goal_actor/goal_actor_bloc.dart';
import 'package:akrasia/ui/routes/router.gr.dart';
import 'package:akrasia/ui/goals/goal_overview/widgets/goal_overview_body_widget.dart';
import 'package:akrasia/injection.dart';

class GoalOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GoalWatcherBloc>(
          create: (context) => getIt<GoalWatcherBloc>()
            ..add(
              const GoalWatcherEvent.watchAllStarted(),
            ),
        ),
        BlocProvider<GoalActorBloc>(
          create: (context) => getIt<GoalActorBloc>(),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) => ExtendedNavigator.of(context).replace(Routes.signInPage),
                orElse: () {},
              );
            },
          ),
          BlocListener<GoalActorBloc, GoalActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: state.failure.map(
                      insufficientPermission: (_) => 'Insufficient permission',
                      unexpected: (_) => 'Unexpected error occured',
                    ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Akrasia'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ExtendedNavigator.of(context).pushGoalFormPage(editedGoal: null);
            },
            child: const Icon(Icons.add),
          ),
          body: GoalOverviewBodyWidget(),
        ),
      ),
    );
  }
}