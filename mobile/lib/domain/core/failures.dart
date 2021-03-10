import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

///
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  // Authentication failures
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
  // Core failures
  const factory ValueFailure.outOfRange({
    @required T failedValue,
  }) = OutOfRange<T>;
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiline({
    @required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.notAlphaNum({
    @required T failedValue,
  }) = NotAlphaNum<T>;
}
