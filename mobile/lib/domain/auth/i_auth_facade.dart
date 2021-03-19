// Package imports:
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:akrasia/domain/auth/auth_failure.dart';
import 'package:akrasia/domain/auth/user.dart';
import 'package:akrasia/domain/auth/value_objects/email_address.dart';
import 'package:akrasia/domain/auth/value_objects/password.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
