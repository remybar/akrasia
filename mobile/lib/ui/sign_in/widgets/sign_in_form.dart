import 'package:akrasia/application/auth/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar_helper.dart';

import 'package:akrasia/ui/routes/router.gr.dart';
import 'package:akrasia/application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                  message: failure.map(
                cancelledByUser: (_) => 'Cancelled',
                emailAlreadyInUse: (_) => 'Email already in use',
                invalidEmailAndPasswordCombination: (_) => 'Invalid email and password combination',
                serverError: (_) => 'Server error',
              )).show(context);
            },
            (_) {
              ExtendedNavigator.of(context).replace(Routes.goalOverviewPage);
              context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
            autovalidateMode: state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: ListView(
              children: [
                const SizedBox(height: 8),
                TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.email), labelText: 'Email'),
                    autocorrect: false,
                    onChanged: (value) => context.read<SignInFormBloc>().add(SignInFormEvent.emailChanged(value)),
                    validator: (_) => context.read<SignInFormBloc>().state.emailAddress.value.fold(
                        (f) => f.maybeMap(invalidEmail: (_) => 'Invalid email', orElse: () => null), (r) => null)),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => context.read<SignInFormBloc>().add(SignInFormEvent.passwordChanged(value)),
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .password
                      .value
                      .fold((f) => f.maybeMap(shortPassword: (_) => 'Short Password', orElse: () => null), (r) => null),
                ),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent.signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('Sign In'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent.registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () {
                      context.read<SignInFormBloc>().add(
                            const SignInFormEvent.signInWithGooglePressed(),
                          );
                    },
//                    color: Colors.lightBlue,
                    child: const Text('Sign in with Google',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                if (state.isSubmitting) ...[
                  const LinearProgressIndicator(),
                ]
              ],
            ));
      },
    );
  }
}
