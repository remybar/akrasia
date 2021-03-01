import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

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
