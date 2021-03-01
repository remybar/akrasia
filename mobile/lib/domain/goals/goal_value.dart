import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';

class GoalValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  static const maxLength = 30;

  factory GoalValue(double input) {
    assert(input != null);
    return GoalValue._(right(input));
  }

  const GoalValue._(this.value);
}
