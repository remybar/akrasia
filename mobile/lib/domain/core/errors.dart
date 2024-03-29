// Project imports:
import 'package:akrasia/domain/core/value_objects/value_failure.dart';

class NotAuthenticatedError extends Error {}

/// represents an error that should never happen.
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
