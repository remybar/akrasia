// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/core/value_objects/value_object.dart';
import 'package:akrasia/domain/core/value_objects/value_validator.dart';

class GoalUnit extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 10;

  factory GoalUnit(String input) {
    assert(input != null);
    return GoalUnit._(validateMaxStringLength(input, maxLength).flatMap(validateAlphaNumOnly));
  }

  const GoalUnit._(this.value);
}
