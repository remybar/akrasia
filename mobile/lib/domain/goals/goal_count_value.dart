import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalCountValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory GoalCountValue(int input) {
    assert(input != null);
    return GoalCountValue._(
      validateIntStrictlyPositive(input),
    );
  }

  const GoalCountValue._(this.value);
}
