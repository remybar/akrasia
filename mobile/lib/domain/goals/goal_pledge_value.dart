import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalPledgeValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const List<int> acceptedValues = [1, 2, 5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 100];

  factory GoalPledgeValue(int input) {
    assert(input != null);
    return GoalPledgeValue._(validateAcceptedValues(input, acceptedValues));
  }

  const GoalPledgeValue._(this.value);
}
