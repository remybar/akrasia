// Package imports:
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import './value_objects/value_failure.dart';
import './value_objects/value_object.dart';

/// Unique ID for an entity.
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  // We cannot let a simple String be passed in. This would allow for possible non-unique IDs.
  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueId.fromUniqueString(String uniqueIdStr) {
    assert(uniqueIdStr != null);
    return UniqueId._(
      right(uniqueIdStr),
    );
  }

  const UniqueId._(this.value);
}
