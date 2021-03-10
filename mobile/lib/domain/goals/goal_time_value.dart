import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalTimeValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const int maxValue = 3600 * 24;

  factory GoalTimeValue(int input) {
    assert(input != null);
    return GoalTimeValue._(
      validateValueRange<int>(input, minValue: 1, maxValue: maxValue),
    );
  }

  const GoalTimeValue._(this.value);
}
