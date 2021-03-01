import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';

class GoalDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory GoalDate(DateTime input) {
    assert(input != null);
    return GoalDate._(right(input));
  }

  const GoalDate._(this.value);
}
