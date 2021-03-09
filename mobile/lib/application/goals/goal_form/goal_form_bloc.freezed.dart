// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'goal_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GoalFormEventTearOff {
  const _$GoalFormEventTearOff();

// ignore: unused_element
  _Initialized initialized(Option<Goal> goalOption) {
    return _Initialized(
      goalOption,
    );
  }

// ignore: unused_element
  _NameChanged nameChanged(String nameStr) {
    return _NameChanged(
      nameStr,
    );
  }

// ignore: unused_element
  _StartDateChanged startDateChanged(DateTime startDate) {
    return _StartDateChanged(
      startDate,
    );
  }

// ignore: unused_element
  _EndDateChanged endDateChanged(DateTime endDate) {
    return _EndDateChanged(
      endDate,
    );
  }

// ignore: unused_element
  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
// ignore: unused_element
const $GoalFormEvent = _$GoalFormEventTearOff();

/// @nodoc
mixin _$GoalFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Goal> goalOption),
    @required TResult nameChanged(String nameStr),
    @required TResult startDateChanged(DateTime startDate),
    @required TResult endDateChanged(DateTime endDate),
    @required TResult saved(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
    TResult startDateChanged(DateTime startDate),
    TResult endDateChanged(DateTime endDate),
    TResult saved(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult startDateChanged(_StartDateChanged value),
    @required TResult endDateChanged(_EndDateChanged value),
    @required TResult saved(_Saved value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult startDateChanged(_StartDateChanged value),
    TResult endDateChanged(_EndDateChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $GoalFormEventCopyWith<$Res> {
  factory $GoalFormEventCopyWith(
          GoalFormEvent value, $Res Function(GoalFormEvent) then) =
      _$GoalFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GoalFormEventCopyWithImpl<$Res>
    implements $GoalFormEventCopyWith<$Res> {
  _$GoalFormEventCopyWithImpl(this._value, this._then);

  final GoalFormEvent _value;
  // ignore: unused_field
  final $Res Function(GoalFormEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({Option<Goal> goalOption});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res> extends _$GoalFormEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object goalOption = freezed,
  }) {
    return _then(_Initialized(
      goalOption == freezed ? _value.goalOption : goalOption as Option<Goal>,
    ));
  }
}

/// @nodoc
class _$_Initialized implements _Initialized {
  const _$_Initialized(this.goalOption) : assert(goalOption != null);

  @override
  final Option<Goal> goalOption;

  @override
  String toString() {
    return 'GoalFormEvent.initialized(goalOption: $goalOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initialized &&
            (identical(other.goalOption, goalOption) ||
                const DeepCollectionEquality()
                    .equals(other.goalOption, goalOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(goalOption);

  @JsonKey(ignore: true)
  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Goal> goalOption),
    @required TResult nameChanged(String nameStr),
    @required TResult startDateChanged(DateTime startDate),
    @required TResult endDateChanged(DateTime endDate),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return initialized(goalOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
    TResult startDateChanged(DateTime startDate),
    TResult endDateChanged(DateTime endDate),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(goalOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult startDateChanged(_StartDateChanged value),
    @required TResult endDateChanged(_EndDateChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult startDateChanged(_StartDateChanged value),
    TResult endDateChanged(_EndDateChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements GoalFormEvent {
  const factory _Initialized(Option<Goal> goalOption) = _$_Initialized;

  Option<Goal> get goalOption;
  @JsonKey(ignore: true)
  _$InitializedCopyWith<_Initialized> get copyWith;
}

/// @nodoc
abstract class _$NameChangedCopyWith<$Res> {
  factory _$NameChangedCopyWith(
          _NameChanged value, $Res Function(_NameChanged) then) =
      __$NameChangedCopyWithImpl<$Res>;
  $Res call({String nameStr});
}

/// @nodoc
class __$NameChangedCopyWithImpl<$Res> extends _$GoalFormEventCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(
      _NameChanged _value, $Res Function(_NameChanged) _then)
      : super(_value, (v) => _then(v as _NameChanged));

  @override
  _NameChanged get _value => super._value as _NameChanged;

  @override
  $Res call({
    Object nameStr = freezed,
  }) {
    return _then(_NameChanged(
      nameStr == freezed ? _value.nameStr : nameStr as String,
    ));
  }
}

/// @nodoc
class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.nameStr) : assert(nameStr != null);

  @override
  final String nameStr;

  @override
  String toString() {
    return 'GoalFormEvent.nameChanged(nameStr: $nameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NameChanged &&
            (identical(other.nameStr, nameStr) ||
                const DeepCollectionEquality().equals(other.nameStr, nameStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(nameStr);

  @JsonKey(ignore: true)
  @override
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Goal> goalOption),
    @required TResult nameChanged(String nameStr),
    @required TResult startDateChanged(DateTime startDate),
    @required TResult endDateChanged(DateTime endDate),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return nameChanged(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
    TResult startDateChanged(DateTime startDate),
    TResult endDateChanged(DateTime endDate),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(nameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult startDateChanged(_StartDateChanged value),
    @required TResult endDateChanged(_EndDateChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult startDateChanged(_StartDateChanged value),
    TResult endDateChanged(_EndDateChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements GoalFormEvent {
  const factory _NameChanged(String nameStr) = _$_NameChanged;

  String get nameStr;
  @JsonKey(ignore: true)
  _$NameChangedCopyWith<_NameChanged> get copyWith;
}

/// @nodoc
abstract class _$StartDateChangedCopyWith<$Res> {
  factory _$StartDateChangedCopyWith(
          _StartDateChanged value, $Res Function(_StartDateChanged) then) =
      __$StartDateChangedCopyWithImpl<$Res>;
  $Res call({DateTime startDate});
}

/// @nodoc
class __$StartDateChangedCopyWithImpl<$Res>
    extends _$GoalFormEventCopyWithImpl<$Res>
    implements _$StartDateChangedCopyWith<$Res> {
  __$StartDateChangedCopyWithImpl(
      _StartDateChanged _value, $Res Function(_StartDateChanged) _then)
      : super(_value, (v) => _then(v as _StartDateChanged));

  @override
  _StartDateChanged get _value => super._value as _StartDateChanged;

  @override
  $Res call({
    Object startDate = freezed,
  }) {
    return _then(_StartDateChanged(
      startDate == freezed ? _value.startDate : startDate as DateTime,
    ));
  }
}

/// @nodoc
class _$_StartDateChanged implements _StartDateChanged {
  const _$_StartDateChanged(this.startDate) : assert(startDate != null);

  @override
  final DateTime startDate;

  @override
  String toString() {
    return 'GoalFormEvent.startDateChanged(startDate: $startDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StartDateChanged &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(startDate);

  @JsonKey(ignore: true)
  @override
  _$StartDateChangedCopyWith<_StartDateChanged> get copyWith =>
      __$StartDateChangedCopyWithImpl<_StartDateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Goal> goalOption),
    @required TResult nameChanged(String nameStr),
    @required TResult startDateChanged(DateTime startDate),
    @required TResult endDateChanged(DateTime endDate),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return startDateChanged(startDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
    TResult startDateChanged(DateTime startDate),
    TResult endDateChanged(DateTime endDate),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (startDateChanged != null) {
      return startDateChanged(startDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult startDateChanged(_StartDateChanged value),
    @required TResult endDateChanged(_EndDateChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return startDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult startDateChanged(_StartDateChanged value),
    TResult endDateChanged(_EndDateChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (startDateChanged != null) {
      return startDateChanged(this);
    }
    return orElse();
  }
}

abstract class _StartDateChanged implements GoalFormEvent {
  const factory _StartDateChanged(DateTime startDate) = _$_StartDateChanged;

  DateTime get startDate;
  @JsonKey(ignore: true)
  _$StartDateChangedCopyWith<_StartDateChanged> get copyWith;
}

/// @nodoc
abstract class _$EndDateChangedCopyWith<$Res> {
  factory _$EndDateChangedCopyWith(
          _EndDateChanged value, $Res Function(_EndDateChanged) then) =
      __$EndDateChangedCopyWithImpl<$Res>;
  $Res call({DateTime endDate});
}

/// @nodoc
class __$EndDateChangedCopyWithImpl<$Res>
    extends _$GoalFormEventCopyWithImpl<$Res>
    implements _$EndDateChangedCopyWith<$Res> {
  __$EndDateChangedCopyWithImpl(
      _EndDateChanged _value, $Res Function(_EndDateChanged) _then)
      : super(_value, (v) => _then(v as _EndDateChanged));

  @override
  _EndDateChanged get _value => super._value as _EndDateChanged;

  @override
  $Res call({
    Object endDate = freezed,
  }) {
    return _then(_EndDateChanged(
      endDate == freezed ? _value.endDate : endDate as DateTime,
    ));
  }
}

/// @nodoc
class _$_EndDateChanged implements _EndDateChanged {
  const _$_EndDateChanged(this.endDate) : assert(endDate != null);

  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'GoalFormEvent.endDateChanged(endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EndDateChanged &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(endDate);

  @JsonKey(ignore: true)
  @override
  _$EndDateChangedCopyWith<_EndDateChanged> get copyWith =>
      __$EndDateChangedCopyWithImpl<_EndDateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Goal> goalOption),
    @required TResult nameChanged(String nameStr),
    @required TResult startDateChanged(DateTime startDate),
    @required TResult endDateChanged(DateTime endDate),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return endDateChanged(endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
    TResult startDateChanged(DateTime startDate),
    TResult endDateChanged(DateTime endDate),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (endDateChanged != null) {
      return endDateChanged(endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult startDateChanged(_StartDateChanged value),
    @required TResult endDateChanged(_EndDateChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return endDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult startDateChanged(_StartDateChanged value),
    TResult endDateChanged(_EndDateChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (endDateChanged != null) {
      return endDateChanged(this);
    }
    return orElse();
  }
}

abstract class _EndDateChanged implements GoalFormEvent {
  const factory _EndDateChanged(DateTime endDate) = _$_EndDateChanged;

  DateTime get endDate;
  @JsonKey(ignore: true)
  _$EndDateChangedCopyWith<_EndDateChanged> get copyWith;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$GoalFormEventCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc
class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'GoalFormEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Goal> goalOption),
    @required TResult nameChanged(String nameStr),
    @required TResult startDateChanged(DateTime startDate),
    @required TResult endDateChanged(DateTime endDate),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
    TResult startDateChanged(DateTime startDate),
    TResult endDateChanged(DateTime endDate),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult startDateChanged(_StartDateChanged value),
    @required TResult endDateChanged(_EndDateChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(startDateChanged != null);
    assert(endDateChanged != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
    TResult startDateChanged(_StartDateChanged value),
    TResult endDateChanged(_EndDateChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements GoalFormEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
class _$GoalFormStateTearOff {
  const _$GoalFormStateTearOff();

// ignore: unused_element
  _GoalFormState call(
      {@required Goal goal,
      @required bool showErrorMessages,
      @required bool isEditing,
      @required bool isSaving,
      @required Option<Either<GoalFailure, Unit>> goalFailureOrSuccessOption}) {
    return _GoalFormState(
      goal: goal,
      showErrorMessages: showErrorMessages,
      isEditing: isEditing,
      isSaving: isSaving,
      goalFailureOrSuccessOption: goalFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GoalFormState = _$GoalFormStateTearOff();

/// @nodoc
mixin _$GoalFormState {
  Goal get goal;
  bool get showErrorMessages;
  bool get isEditing;
  bool get isSaving;
  Option<Either<GoalFailure, Unit>> get goalFailureOrSuccessOption;

  @JsonKey(ignore: true)
  $GoalFormStateCopyWith<GoalFormState> get copyWith;
}

/// @nodoc
abstract class $GoalFormStateCopyWith<$Res> {
  factory $GoalFormStateCopyWith(
          GoalFormState value, $Res Function(GoalFormState) then) =
      _$GoalFormStateCopyWithImpl<$Res>;
  $Res call(
      {Goal goal,
      bool showErrorMessages,
      bool isEditing,
      bool isSaving,
      Option<Either<GoalFailure, Unit>> goalFailureOrSuccessOption});

  $GoalCopyWith<$Res> get goal;
}

/// @nodoc
class _$GoalFormStateCopyWithImpl<$Res>
    implements $GoalFormStateCopyWith<$Res> {
  _$GoalFormStateCopyWithImpl(this._value, this._then);

  final GoalFormState _value;
  // ignore: unused_field
  final $Res Function(GoalFormState) _then;

  @override
  $Res call({
    Object goal = freezed,
    Object showErrorMessages = freezed,
    Object isEditing = freezed,
    Object isSaving = freezed,
    Object goalFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      goal: goal == freezed ? _value.goal : goal as Goal,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      goalFailureOrSuccessOption: goalFailureOrSuccessOption == freezed
          ? _value.goalFailureOrSuccessOption
          : goalFailureOrSuccessOption as Option<Either<GoalFailure, Unit>>,
    ));
  }

  @override
  $GoalCopyWith<$Res> get goal {
    if (_value.goal == null) {
      return null;
    }
    return $GoalCopyWith<$Res>(_value.goal, (value) {
      return _then(_value.copyWith(goal: value));
    });
  }
}

/// @nodoc
abstract class _$GoalFormStateCopyWith<$Res>
    implements $GoalFormStateCopyWith<$Res> {
  factory _$GoalFormStateCopyWith(
          _GoalFormState value, $Res Function(_GoalFormState) then) =
      __$GoalFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Goal goal,
      bool showErrorMessages,
      bool isEditing,
      bool isSaving,
      Option<Either<GoalFailure, Unit>> goalFailureOrSuccessOption});

  @override
  $GoalCopyWith<$Res> get goal;
}

/// @nodoc
class __$GoalFormStateCopyWithImpl<$Res>
    extends _$GoalFormStateCopyWithImpl<$Res>
    implements _$GoalFormStateCopyWith<$Res> {
  __$GoalFormStateCopyWithImpl(
      _GoalFormState _value, $Res Function(_GoalFormState) _then)
      : super(_value, (v) => _then(v as _GoalFormState));

  @override
  _GoalFormState get _value => super._value as _GoalFormState;

  @override
  $Res call({
    Object goal = freezed,
    Object showErrorMessages = freezed,
    Object isEditing = freezed,
    Object isSaving = freezed,
    Object goalFailureOrSuccessOption = freezed,
  }) {
    return _then(_GoalFormState(
      goal: goal == freezed ? _value.goal : goal as Goal,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      goalFailureOrSuccessOption: goalFailureOrSuccessOption == freezed
          ? _value.goalFailureOrSuccessOption
          : goalFailureOrSuccessOption as Option<Either<GoalFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_GoalFormState implements _GoalFormState {
  const _$_GoalFormState(
      {@required this.goal,
      @required this.showErrorMessages,
      @required this.isEditing,
      @required this.isSaving,
      @required this.goalFailureOrSuccessOption})
      : assert(goal != null),
        assert(showErrorMessages != null),
        assert(isEditing != null),
        assert(isSaving != null),
        assert(goalFailureOrSuccessOption != null);

  @override
  final Goal goal;
  @override
  final bool showErrorMessages;
  @override
  final bool isEditing;
  @override
  final bool isSaving;
  @override
  final Option<Either<GoalFailure, Unit>> goalFailureOrSuccessOption;

  @override
  String toString() {
    return 'GoalFormState(goal: $goal, showErrorMessages: $showErrorMessages, isEditing: $isEditing, isSaving: $isSaving, goalFailureOrSuccessOption: $goalFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoalFormState &&
            (identical(other.goal, goal) ||
                const DeepCollectionEquality().equals(other.goal, goal)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.goalFailureOrSuccessOption,
                    goalFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.goalFailureOrSuccessOption,
                    goalFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goal) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(goalFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$GoalFormStateCopyWith<_GoalFormState> get copyWith =>
      __$GoalFormStateCopyWithImpl<_GoalFormState>(this, _$identity);
}

abstract class _GoalFormState implements GoalFormState {
  const factory _GoalFormState(
          {@required
              Goal goal,
          @required
              bool showErrorMessages,
          @required
              bool isEditing,
          @required
              bool isSaving,
          @required
              Option<Either<GoalFailure, Unit>> goalFailureOrSuccessOption}) =
      _$_GoalFormState;

  @override
  Goal get goal;
  @override
  bool get showErrorMessages;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  Option<Either<GoalFailure, Unit>> get goalFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$GoalFormStateCopyWith<_GoalFormState> get copyWith;
}
