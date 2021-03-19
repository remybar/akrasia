// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_failure.freezed.dart';

/// Failures associated to goal usage (CRUD)
@freezed
abstract class GoalFailure with _$GoalFailure {
  const factory GoalFailure.unexpected() = _Unexpected;
  const factory GoalFailure.insufficientPermission() = _InsufficientPermission;
}
