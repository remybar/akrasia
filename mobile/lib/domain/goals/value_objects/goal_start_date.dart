// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/core/value_objects/value_object.dart';
import 'package:akrasia/domain/core/value_objects/value_validator.dart';

// A goal start date has a time set to 00:00:00
class GoalStartDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory GoalStartDate(DateTime input) {
    return GoalStartDate._(
      validateNotNull<DateTime>(
        (input != null) ? DateTime(input.year, input.month, input.day) : null,
      ),
    );
  }

  factory GoalStartDate.empty() => GoalStartDate(DateTime.now());

  const GoalStartDate._(this.value);
}
