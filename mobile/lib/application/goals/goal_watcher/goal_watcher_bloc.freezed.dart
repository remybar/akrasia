// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'goal_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GoalWatcherEventTearOff {
  const _$GoalWatcherEventTearOff();

// ignore: unused_element
  _WatchAllStarted watchAllStarted() {
    return const _WatchAllStarted();
  }

// ignore: unused_element
  _WatchAllStartedAtDate watchAllStartedAtDate(DateTime date) {
    return _WatchAllStartedAtDate(
      date,
    );
  }

// ignore: unused_element
  _GoalReceived goalsReceived(
      Either<GoalFailure, KtList<Goal>> failureOrGoals) {
    return _GoalReceived(
      failureOrGoals,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GoalWatcherEvent = _$GoalWatcherEventTearOff();

/// @nodoc
mixin _$GoalWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchAllStartedAtDate(DateTime date),
    @required
        TResult goalsReceived(Either<GoalFailure, KtList<Goal>> failureOrGoals),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchAllStartedAtDate(DateTime date),
    TResult goalsReceived(Either<GoalFailure, KtList<Goal>> failureOrGoals),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchAllStartedAtDate(_WatchAllStartedAtDate value),
    @required TResult goalsReceived(_GoalReceived value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchAllStartedAtDate(_WatchAllStartedAtDate value),
    TResult goalsReceived(_GoalReceived value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $GoalWatcherEventCopyWith<$Res> {
  factory $GoalWatcherEventCopyWith(
          GoalWatcherEvent value, $Res Function(GoalWatcherEvent) then) =
      _$GoalWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GoalWatcherEventCopyWithImpl<$Res>
    implements $GoalWatcherEventCopyWith<$Res> {
  _$GoalWatcherEventCopyWithImpl(this._value, this._then);

  final GoalWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(GoalWatcherEvent) _then;
}

/// @nodoc
abstract class _$WatchAllStartedCopyWith<$Res> {
  factory _$WatchAllStartedCopyWith(
          _WatchAllStarted value, $Res Function(_WatchAllStarted) then) =
      __$WatchAllStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WatchAllStartedCopyWithImpl<$Res>
    extends _$GoalWatcherEventCopyWithImpl<$Res>
    implements _$WatchAllStartedCopyWith<$Res> {
  __$WatchAllStartedCopyWithImpl(
      _WatchAllStarted _value, $Res Function(_WatchAllStarted) _then)
      : super(_value, (v) => _then(v as _WatchAllStarted));

  @override
  _WatchAllStarted get _value => super._value as _WatchAllStarted;
}

/// @nodoc
class _$_WatchAllStarted implements _WatchAllStarted {
  const _$_WatchAllStarted();

  @override
  String toString() {
    return 'GoalWatcherEvent.watchAllStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WatchAllStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchAllStartedAtDate(DateTime date),
    @required
        TResult goalsReceived(Either<GoalFailure, KtList<Goal>> failureOrGoals),
  }) {
    assert(watchAllStarted != null);
    assert(watchAllStartedAtDate != null);
    assert(goalsReceived != null);
    return watchAllStarted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchAllStartedAtDate(DateTime date),
    TResult goalsReceived(Either<GoalFailure, KtList<Goal>> failureOrGoals),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchAllStarted != null) {
      return watchAllStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchAllStartedAtDate(_WatchAllStartedAtDate value),
    @required TResult goalsReceived(_GoalReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchAllStartedAtDate != null);
    assert(goalsReceived != null);
    return watchAllStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchAllStartedAtDate(_WatchAllStartedAtDate value),
    TResult goalsReceived(_GoalReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchAllStarted != null) {
      return watchAllStarted(this);
    }
    return orElse();
  }
}

abstract class _WatchAllStarted implements GoalWatcherEvent {
  const factory _WatchAllStarted() = _$_WatchAllStarted;
}

/// @nodoc
abstract class _$WatchAllStartedAtDateCopyWith<$Res> {
  factory _$WatchAllStartedAtDateCopyWith(_WatchAllStartedAtDate value,
          $Res Function(_WatchAllStartedAtDate) then) =
      __$WatchAllStartedAtDateCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$WatchAllStartedAtDateCopyWithImpl<$Res>
    extends _$GoalWatcherEventCopyWithImpl<$Res>
    implements _$WatchAllStartedAtDateCopyWith<$Res> {
  __$WatchAllStartedAtDateCopyWithImpl(_WatchAllStartedAtDate _value,
      $Res Function(_WatchAllStartedAtDate) _then)
      : super(_value, (v) => _then(v as _WatchAllStartedAtDate));

  @override
  _WatchAllStartedAtDate get _value => super._value as _WatchAllStartedAtDate;

  @override
  $Res call({
    Object date = freezed,
  }) {
    return _then(_WatchAllStartedAtDate(
      date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_WatchAllStartedAtDate implements _WatchAllStartedAtDate {
  const _$_WatchAllStartedAtDate(this.date) : assert(date != null);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'GoalWatcherEvent.watchAllStartedAtDate(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WatchAllStartedAtDate &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$WatchAllStartedAtDateCopyWith<_WatchAllStartedAtDate> get copyWith =>
      __$WatchAllStartedAtDateCopyWithImpl<_WatchAllStartedAtDate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchAllStartedAtDate(DateTime date),
    @required
        TResult goalsReceived(Either<GoalFailure, KtList<Goal>> failureOrGoals),
  }) {
    assert(watchAllStarted != null);
    assert(watchAllStartedAtDate != null);
    assert(goalsReceived != null);
    return watchAllStartedAtDate(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchAllStartedAtDate(DateTime date),
    TResult goalsReceived(Either<GoalFailure, KtList<Goal>> failureOrGoals),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchAllStartedAtDate != null) {
      return watchAllStartedAtDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchAllStartedAtDate(_WatchAllStartedAtDate value),
    @required TResult goalsReceived(_GoalReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchAllStartedAtDate != null);
    assert(goalsReceived != null);
    return watchAllStartedAtDate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchAllStartedAtDate(_WatchAllStartedAtDate value),
    TResult goalsReceived(_GoalReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchAllStartedAtDate != null) {
      return watchAllStartedAtDate(this);
    }
    return orElse();
  }
}

abstract class _WatchAllStartedAtDate implements GoalWatcherEvent {
  const factory _WatchAllStartedAtDate(DateTime date) =
      _$_WatchAllStartedAtDate;

  DateTime get date;
  @JsonKey(ignore: true)
  _$WatchAllStartedAtDateCopyWith<_WatchAllStartedAtDate> get copyWith;
}

/// @nodoc
abstract class _$GoalReceivedCopyWith<$Res> {
  factory _$GoalReceivedCopyWith(
          _GoalReceived value, $Res Function(_GoalReceived) then) =
      __$GoalReceivedCopyWithImpl<$Res>;
  $Res call({Either<GoalFailure, KtList<Goal>> failureOrGoals});
}

/// @nodoc
class __$GoalReceivedCopyWithImpl<$Res>
    extends _$GoalWatcherEventCopyWithImpl<$Res>
    implements _$GoalReceivedCopyWith<$Res> {
  __$GoalReceivedCopyWithImpl(
      _GoalReceived _value, $Res Function(_GoalReceived) _then)
      : super(_value, (v) => _then(v as _GoalReceived));

  @override
  _GoalReceived get _value => super._value as _GoalReceived;

  @override
  $Res call({
    Object failureOrGoals = freezed,
  }) {
    return _then(_GoalReceived(
      failureOrGoals == freezed
          ? _value.failureOrGoals
          : failureOrGoals as Either<GoalFailure, KtList<Goal>>,
    ));
  }
}

/// @nodoc
class _$_GoalReceived implements _GoalReceived {
  const _$_GoalReceived(this.failureOrGoals) : assert(failureOrGoals != null);

  @override
  final Either<GoalFailure, KtList<Goal>> failureOrGoals;

  @override
  String toString() {
    return 'GoalWatcherEvent.goalsReceived(failureOrGoals: $failureOrGoals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoalReceived &&
            (identical(other.failureOrGoals, failureOrGoals) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrGoals, failureOrGoals)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrGoals);

  @JsonKey(ignore: true)
  @override
  _$GoalReceivedCopyWith<_GoalReceived> get copyWith =>
      __$GoalReceivedCopyWithImpl<_GoalReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchAllStartedAtDate(DateTime date),
    @required
        TResult goalsReceived(Either<GoalFailure, KtList<Goal>> failureOrGoals),
  }) {
    assert(watchAllStarted != null);
    assert(watchAllStartedAtDate != null);
    assert(goalsReceived != null);
    return goalsReceived(failureOrGoals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchAllStartedAtDate(DateTime date),
    TResult goalsReceived(Either<GoalFailure, KtList<Goal>> failureOrGoals),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (goalsReceived != null) {
      return goalsReceived(failureOrGoals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchAllStartedAtDate(_WatchAllStartedAtDate value),
    @required TResult goalsReceived(_GoalReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchAllStartedAtDate != null);
    assert(goalsReceived != null);
    return goalsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchAllStartedAtDate(_WatchAllStartedAtDate value),
    TResult goalsReceived(_GoalReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (goalsReceived != null) {
      return goalsReceived(this);
    }
    return orElse();
  }
}

abstract class _GoalReceived implements GoalWatcherEvent {
  const factory _GoalReceived(
      Either<GoalFailure, KtList<Goal>> failureOrGoals) = _$_GoalReceived;

  Either<GoalFailure, KtList<Goal>> get failureOrGoals;
  @JsonKey(ignore: true)
  _$GoalReceivedCopyWith<_GoalReceived> get copyWith;
}

/// @nodoc
class _$GoalWatcherStateTearOff {
  const _$GoalWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _Loaded loaded(KtList<Goal> goals) {
    return _Loaded(
      goals,
    );
  }

// ignore: unused_element
  _LoadFailure loadFailure(GoalFailure failure) {
    return _LoadFailure(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GoalWatcherState = _$GoalWatcherStateTearOff();

/// @nodoc
mixin _$GoalWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(KtList<Goal> goals),
    @required TResult loadFailure(GoalFailure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(KtList<Goal> goals),
    TResult loadFailure(GoalFailure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult loaded(_Loaded value),
    @required TResult loadFailure(_LoadFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult loaded(_Loaded value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $GoalWatcherStateCopyWith<$Res> {
  factory $GoalWatcherStateCopyWith(
          GoalWatcherState value, $Res Function(GoalWatcherState) then) =
      _$GoalWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GoalWatcherStateCopyWithImpl<$Res>
    implements $GoalWatcherStateCopyWith<$Res> {
  _$GoalWatcherStateCopyWithImpl(this._value, this._then);

  final GoalWatcherState _value;
  // ignore: unused_field
  final $Res Function(GoalWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$GoalWatcherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'GoalWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(KtList<Goal> goals),
    @required TResult loadFailure(GoalFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(loadFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(KtList<Goal> goals),
    TResult loadFailure(GoalFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult loaded(_Loaded value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(loadFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult loaded(_Loaded value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GoalWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$GoalWatcherStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'GoalWatcherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(KtList<Goal> goals),
    @required TResult loadFailure(GoalFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(loadFailure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(KtList<Goal> goals),
    TResult loadFailure(GoalFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult loaded(_Loaded value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(loadFailure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult loaded(_Loaded value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GoalWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({KtList<Goal> goals});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$GoalWatcherStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object goals = freezed,
  }) {
    return _then(_Loaded(
      goals == freezed ? _value.goals : goals as KtList<Goal>,
    ));
  }
}

/// @nodoc
class _$_Loaded implements _Loaded {
  const _$_Loaded(this.goals) : assert(goals != null);

  @override
  final KtList<Goal> goals;

  @override
  String toString() {
    return 'GoalWatcherState.loaded(goals: $goals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.goals, goals) ||
                const DeepCollectionEquality().equals(other.goals, goals)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goals);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(KtList<Goal> goals),
    @required TResult loadFailure(GoalFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(loadFailure != null);
    return loaded(goals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(KtList<Goal> goals),
    TResult loadFailure(GoalFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(goals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult loaded(_Loaded value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(loadFailure != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult loaded(_Loaded value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements GoalWatcherState {
  const factory _Loaded(KtList<Goal> goals) = _$_Loaded;

  KtList<Goal> get goals;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({GoalFailure failure});

  $GoalFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$GoalWatcherStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_LoadFailure(
      failure == freezed ? _value.failure : failure as GoalFailure,
    ));
  }

  @override
  $GoalFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $GoalFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.failure) : assert(failure != null);

  @override
  final GoalFailure failure;

  @override
  String toString() {
    return 'GoalWatcherState.loadFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(KtList<Goal> goals),
    @required TResult loadFailure(GoalFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(loadFailure != null);
    return loadFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(KtList<Goal> goals),
    TResult loadFailure(GoalFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loading(_Loading value),
    @required TResult loaded(_Loaded value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(loadFailure != null);
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loading(_Loading value),
    TResult loaded(_Loaded value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements GoalWatcherState {
  const factory _LoadFailure(GoalFailure failure) = _$_LoadFailure;

  GoalFailure get failure;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith;
}
