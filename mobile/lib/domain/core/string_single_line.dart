import 'package:dartz/dartz.dart';

import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_validators.dart';
import 'value_object.dart';

class StringSingleLine extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringSingleLine(String input) {
    assert(input != null);
    return StringSingleLine._(
      validateSingleLine(input),
    );
  }

  const StringSingleLine._(this.value);
}
