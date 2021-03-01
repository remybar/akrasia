import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:akrasia/domain/auth/user.dart';
import 'package:akrasia/domain/auth/email_address.dart';
import 'package:akrasia/domain/core/unique_id.dart';

@lazySingleton
extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return this == null
        ? null
        : User(
            id: UniqueId.fromUniqueString(uid),
            emailAddress: EmailAddress(email),
          );
  }
}
