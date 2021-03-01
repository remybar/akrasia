import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalUnit extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 10;

  factory GoalUnit(String input) {
    assert(input != null);
    return GoalUnit._(
      validateMaxStringLength(input, maxLength).flatMap(validateAlphaNumOnly),
    );
  }

  const GoalUnit._(this.value);
}
