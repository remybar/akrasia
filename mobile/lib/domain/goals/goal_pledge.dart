import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';

class GoalPledge extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory GoalPledge(int input) {
    assert(input != null);
    return GoalPledge._(right(input));
  }

  const GoalPledge._(this.value);
}
