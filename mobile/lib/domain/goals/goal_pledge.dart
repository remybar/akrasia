import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalPledge extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const int maxValue = 100;

  factory GoalPledge(int input) {
    assert(input != null);
    return GoalPledge._(validateValueRange<int>(
      input,
      minValue: 1,
      maxValue: maxValue,
    ));
  }

  const GoalPledge._(this.value);
}
