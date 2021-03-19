// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/core/value_objects/value_object.dart';
import 'package:akrasia/domain/core/value_objects/value_validator.dart';

class GoalStartDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory GoalStartDate(DateTime input) {
    return GoalStartDate._(validateNotNull<DateTime>(input));
  }

  factory GoalStartDate.empty() => GoalStartDate(DateTime.now());

  const GoalStartDate._(this.value);
}
