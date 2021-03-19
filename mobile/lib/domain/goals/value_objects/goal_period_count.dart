// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/core/value_objects/value_object.dart';
import 'package:akrasia/domain/core/value_objects/value_validator.dart';

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
