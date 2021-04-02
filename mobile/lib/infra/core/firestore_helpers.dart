// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:akrasia/domain/auth/i_auth_facade.dart';
import 'package:akrasia/domain/core/errors.dart';
import 'package:akrasia/injection.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance.collection('users').doc(user.id.getOrCrash());
  }

  Future<String> uid() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return user.id.getOrCrash();
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get goals => collection('goals');
}
