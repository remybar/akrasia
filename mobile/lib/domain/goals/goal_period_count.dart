import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalPeriodCount extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const maxValue = 20;

  factory GoalPeriodCount(int input) {
    assert(input != null);
    return GoalPeriodCount._(
      validateValueRange<int>(input, minValue: 1, maxValue: maxValue),
    );
  }

  const GoalPeriodCount._(this.value);
}
