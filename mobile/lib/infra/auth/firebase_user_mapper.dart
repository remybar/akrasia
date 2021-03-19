// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:akrasia/domain/auth/user.dart';
import 'package:akrasia/domain/auth/value_objects/email_address.dart';
import 'package:akrasia/domain/core/unique_id.dart';

@lazySingleton
extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
      emailAddress: EmailAddress(email),
    );
  }
}
