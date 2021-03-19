// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:akrasia/domain/core/value_objects/value_failure.dart';
import 'package:akrasia/domain/core/value_objects/value_object.dart';
import 'package:akrasia/domain/core/value_objects/value_validator.dart';

class GoalTimeValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const int maxValue = 3600 * 24;

  factory GoalTimeValue(int input) {
    assert(input != null);
    return GoalTimeValue._(
      validateValueRange<int>(input, minValue: 1, maxValue: maxValue),
    );
  }

  factory GoalTimeValue.from({int hours = 0, int minutes = 0, int seconds = 0}) {
    return GoalTimeValue(hours * 3600 + minutes * 60 + seconds);
  }

  int getHoursOrCrash() {
    return getOrCrash() ~/ 3600;
  }

  int getMinutesOrCrash() {
    return (getOrCrash() - getHoursOrCrash() * 3600) ~/ 60;
  }

  int getSecondsOrCrash() {
    return getOrCrash() - getHoursOrCrash() * 3600 - getMinutesOrCrash() * 60;
  }

  const GoalTimeValue._(this.value);
}
