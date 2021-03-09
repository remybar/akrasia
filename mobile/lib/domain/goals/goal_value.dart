import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory GoalValue(double input) {
    assert(input != null);
    return GoalValue._(
      validateDoubleStrictlyPositive(input),
    );
  }

  const GoalValue._(this.value);
}
