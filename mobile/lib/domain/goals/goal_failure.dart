import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_failure.freezed.dart';

@freezed
abstract class GoalFailure with _$GoalFailure {
  const factory GoalFailure.unexpected() = _Unexpected;
  const factory GoalFailure.insufficientPermission() = _InsufficientPermission;
}
