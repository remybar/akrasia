// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/core/value_objects/value_object.dart';
import 'package:akrasia/domain/core/value_objects/value_validator.dart';

class GoalName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory GoalName(String input) {
    assert(input != null);
    return GoalName._(
      validateMaxStringLength(input, maxLength).flatMap(validateAlphaNumOnly),
    );
  }

  const GoalName._(this.value);
}
