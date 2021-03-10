import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';

/// validate that the value [input] is in the specified range [minValue] - [maxValue].
/// [minValue] or [maxValue] may be null. In this case, it is just ignored
Either<ValueFailure<T>, T> validateValueRange<T extends Comparable>(
  T input, {
  T minValue,
  T maxValue,
}) {
  if (minValue != null && input.compareTo(minValue) < 0) {
    return left(ValueFailure.outOfRange(failedValue: input));
  }
  if (maxValue != null && input.compareTo(maxValue) > 0) {
    return left(ValueFailure.outOfRange(failedValue: input));
  }
  return right(input);
}

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateAlphaNumOnly(String input) {
  const alphaNumRegex = r"""[a-zA-Z0-9\-_]+""";
  if (!RegExp(alphaNumRegex).hasMatch(input)) {
    return left(ValueFailure.notAlphaNum(failedValue: input));
  } else {
    return right(input);
  }
}
