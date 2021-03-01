// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i11;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i10;
import 'application/goals/goal_actor/goal_actor_bloc.dart' as _i4;
import 'application/goals/goal_watcher/goal_watcher_bloc.dart' as _i6;
import 'domain/auth/i_auth_facade.dart' as _i8;
import 'domain/goals/i_goal_repository.dart' as _i5;
import 'infra/auth/firebase_auth_facade.dart' as _i9;
import 'infra/core/firebase_injectable_module.dart' as _i12;

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
  gh.factory<_i4.GoalActorBloc>(
      () => _i4.GoalActorBloc(get<_i5.IGoalRepository>()));
  gh.factory<_i6.GoalWatcherBloc>(
      () => _i6.GoalWatcherBloc(get<_i5.IGoalRepository>()));
  gh.lazySingleton<_i7.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i8.IAuthFacade>(
      () => _i9.FirebaseAuthFacade(
          get<_i3.FirebaseAuth>(), get<_i7.GoogleSignIn>()),
      registerFor: {_prod});
  gh.factory<_i10.SignInFormBloc>(
      () => _i10.SignInFormBloc(get<_i8.IAuthFacade>()));
  gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(get<_i8.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i12.FirebaseInjectableModule {}
