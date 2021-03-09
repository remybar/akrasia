import 'package:dartz/dartz.dart';
import 'package:akrasia/domain/core/failures.dart';

Either<ValueFailure<double>, double> validateDoubleStrictlyPositive(
  double input,
) {
  if (input <= 0.0) {
    return left(ValueFailure.negativeOrNull(failedValue: input));
  }
  return right(input);
}

Either<ValueFailure<int>, int> validateIntStrictlyPositive(
  int input,
) {
  if (input <= 0) {
    return left(ValueFailure.negativeOrNull(failedValue: input));
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
