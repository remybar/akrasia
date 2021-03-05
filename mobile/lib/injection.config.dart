// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i10;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i9;
import 'application/goals/goal_actor/goal_actor_bloc.dart' as _i11;
import 'application/goals/goal_form/goal_form_bloc.dart' as _i12;
import 'application/goals/goal_watcher/goal_watcher_bloc.dart' as _i13;
import 'domain/auth/i_auth_facade.dart' as _i5;
import 'domain/goals/i_goal_repository.dart' as _i7;
import 'infra/auth/firebase_auth_facade.dart' as _i6;
import 'infra/core/firebase_injectable_module.dart' as _i14;
import 'infra/goals/goal_repository.dart' as _i8;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i5.IAuthFacade>(
      () => _i6.FirebaseAuthFacade(
          get<_i3.FirebaseAuth>(), get<_i4.GoogleSignIn>()),
      registerFor: {_prod});
  gh.lazySingleton<_i7.IGoalRepository>(() => _i8.GoalRepository());
  gh.factory<_i9.SignInFormBloc>(
      () => _i9.SignInFormBloc(get<_i5.IAuthFacade>()));
  gh.factory<_i10.AuthBloc>(() => _i10.AuthBloc(get<_i5.IAuthFacade>()));
  gh.factory<_i11.GoalActorBloc>(
      () => _i11.GoalActorBloc(get<_i7.IGoalRepository>()));
  gh.factory<_i12.GoalFormBloc>(
      () => _i12.GoalFormBloc(get<_i7.IGoalRepository>()));
  gh.factory<_i13.GoalWatcherBloc>(
      () => _i13.GoalWatcherBloc(get<_i7.IGoalRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends _i14.FirebaseInjectableModule {}
