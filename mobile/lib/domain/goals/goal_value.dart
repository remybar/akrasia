import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  static const double minValue = 0.001;
  static const double maxValue = 1000000.0;

  factory GoalValue(double input) {
    assert(input != null);
    return GoalValue._(
      validateValueRange<double>(
        input,
        minValue: minValue,
        maxValue: maxValue,
      ),
    );
  }

  const GoalValue._(this.value);
}
