import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';
import 'package:akrasia/domain/core/value_object.dart';
import 'package:akrasia/domain/core/value_validators.dart';

class GoalStartDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory GoalStartDate(DateTime input) {
    return GoalStartDate._(validateNotNull<DateTime>(input));
  }

  factory GoalStartDate.empty() => GoalStartDate(DateTime.now());

  const GoalStartDate._(this.value);
}
