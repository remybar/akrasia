// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:akrasia/domain/auth/value_objects/email_address.dart';
import 'package:akrasia/domain/core/entity.dart';
import 'package:akrasia/domain/core/unique_id.dart';
import 'package:akrasia/domain/core/value_objects/value_failure.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User implements IEntity {
  const factory User({
    @required UniqueId id,
    @required EmailAddress emailAddress,
  }) = _User;
}

extension UserX on User {
  Option<ValueFailure<dynamic>> get failureOption {
    return emailAddress.failureOrUnit.fold((l) => some(l), (r) => none());
  }
}
