import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalTimeValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory GoalTimeValue(double input) {
    assert(input != null);
    return GoalTimeValue._(
      validateDoubleStrictlyPositive(input),
    );
  }

  const GoalTimeValue._(this.value);
}
