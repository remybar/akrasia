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
    @required TResult saved(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
    TResult saved(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult nameChanged(_NameChanged value),
    @required TResult saved(_Saved value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
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
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return initialized(goalOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
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
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
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
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return nameChanged(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
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
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
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
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Goal> goalOption),
    TResult nameChanged(String nameStr),
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
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult nameChanged(_NameChanged value),
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
