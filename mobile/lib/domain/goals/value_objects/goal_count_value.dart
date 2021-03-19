// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/core/value_objects/value_object.dart';
import 'package:akrasia/domain/core/value_objects/value_validator.dart';

class GoalCountValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const int maxValue = 10000;

  factory GoalCountValue(int input) {
    assert(input != null);
    return GoalCountValue._(
      validateValueRange<int>(input, minValue: 1, maxValue: maxValue),
    );
  }

  const GoalCountValue._(this.value);
}
