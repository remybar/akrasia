import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:akrasia/domain/auth/auth_failure.dart';
import 'package:akrasia/domain/auth/user.dart';
import 'package:akrasia/domain/auth/email_address.dart';
import 'package:akrasia/domain/auth/password.dart';

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
