// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GoalTearOff {
  const _$GoalTearOff();

// ignore: unused_element
  _Goal call(
      {@required UniqueId id,
      @required GoalName name,
      @required bool toReach}) {
    return _Goal(
      id: id,
      name: name,
      toReach: toReach,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Goal = _$GoalTearOff();

/// @nodoc
mixin _$Goal {
  UniqueId get id;
  GoalName get name;
  bool get toReach;

  @JsonKey(ignore: true)
  $GoalCopyWith<Goal> get copyWith;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res>;
  $Res call({UniqueId id, GoalName name, bool toReach});
}

/// @nodoc
class _$GoalCopyWithImpl<$Res> implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  final Goal _value;
  // ignore: unused_field
  final $Res Function(Goal) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object toReach = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as GoalName,
      toReach: toReach == freezed ? _value.toReach : toReach as bool,
    ));
  }
}

/// @nodoc
abstract class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) then) =
      __$GoalCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, GoalName name, bool toReach});
}

/// @nodoc
class __$GoalCopyWithImpl<$Res> extends _$GoalCopyWithImpl<$Res>
    implements _$GoalCopyWith<$Res> {
  __$GoalCopyWithImpl(_Goal _value, $Res Function(_Goal) _then)
      : super(_value, (v) => _then(v as _Goal));

  @override
  _Goal get _value => super._value as _Goal;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object toReach = freezed,
  }) {
    return _then(_Goal(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as GoalName,
      toReach: toReach == freezed ? _value.toReach : toReach as bool,
    ));
  }
}

/// @nodoc
class _$_Goal with DiagnosticableTreeMixin implements _Goal {
  const _$_Goal(
      {@required this.id, @required this.name, @required this.toReach})
      : assert(id != null),
        assert(name != null),
        assert(toReach != null);

  @override
  final UniqueId id;
  @override
  final GoalName name;
  @override
  final bool toReach;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Goal(id: $id, name: $name, toReach: $toReach)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Goal'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('toReach', toReach));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Goal &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.toReach, toReach) ||
                const DeepCollectionEquality().equals(other.toReach, toReach)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(toReach);

  @JsonKey(ignore: true)
  @override
  _$GoalCopyWith<_Goal> get copyWith =>
      __$GoalCopyWithImpl<_Goal>(this, _$identity);
}

abstract class _Goal implements Goal {
  const factory _Goal(
      {@required UniqueId id,
      @required GoalName name,
      @required bool toReach}) = _$_Goal;

  @override
  UniqueId get id;
  @override
  GoalName get name;
  @override
  bool get toReach;
  @override
  @JsonKey(ignore: true)
  _$GoalCopyWith<_Goal> get copyWith;
}
