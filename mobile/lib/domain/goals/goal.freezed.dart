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
      @required bool toReach,
      @required GoalType type,
      @required GoalPeriod period,
      @required GoalDate startDate,
      GoalDate endDate,
      GoalPledge startPledge,
      GoalPledge endPledge,
      GoalDate startPause,
      GoalDate endPause}) {
    return _Goal(
      id: id,
      name: name,
      toReach: toReach,
      type: type,
      period: period,
      startDate: startDate,
      endDate: endDate,
      startPledge: startPledge,
      endPledge: endPledge,
      startPause: startPause,
      endPause: endPause,
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
  GoalType get type;
  GoalPeriod get period;
  GoalDate get startDate;
  GoalDate get endDate;
  GoalPledge get startPledge;
  GoalPledge get endPledge;
  GoalDate get startPause;
  GoalDate get endPause;

  @JsonKey(ignore: true)
  $GoalCopyWith<Goal> get copyWith;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      GoalName name,
      bool toReach,
      GoalType type,
      GoalPeriod period,
      GoalDate startDate,
      GoalDate endDate,
      GoalPledge startPledge,
      GoalPledge endPledge,
      GoalDate startPause,
      GoalDate endPause});
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
    Object type = freezed,
    Object period = freezed,
    Object startDate = freezed,
    Object endDate = freezed,
    Object startPledge = freezed,
    Object endPledge = freezed,
    Object startPause = freezed,
    Object endPause = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as GoalName,
      toReach: toReach == freezed ? _value.toReach : toReach as bool,
      type: type == freezed ? _value.type : type as GoalType,
      period: period == freezed ? _value.period : period as GoalPeriod,
      startDate:
          startDate == freezed ? _value.startDate : startDate as GoalDate,
      endDate: endDate == freezed ? _value.endDate : endDate as GoalDate,
      startPledge: startPledge == freezed
          ? _value.startPledge
          : startPledge as GoalPledge,
      endPledge:
          endPledge == freezed ? _value.endPledge : endPledge as GoalPledge,
      startPause:
          startPause == freezed ? _value.startPause : startPause as GoalDate,
      endPause: endPause == freezed ? _value.endPause : endPause as GoalDate,
    ));
  }
}

/// @nodoc
abstract class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) then) =
      __$GoalCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      GoalName name,
      bool toReach,
      GoalType type,
      GoalPeriod period,
      GoalDate startDate,
      GoalDate endDate,
      GoalPledge startPledge,
      GoalPledge endPledge,
      GoalDate startPause,
      GoalDate endPause});
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
    Object type = freezed,
    Object period = freezed,
    Object startDate = freezed,
    Object endDate = freezed,
    Object startPledge = freezed,
    Object endPledge = freezed,
    Object startPause = freezed,
    Object endPause = freezed,
  }) {
    return _then(_Goal(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as GoalName,
      toReach: toReach == freezed ? _value.toReach : toReach as bool,
      type: type == freezed ? _value.type : type as GoalType,
      period: period == freezed ? _value.period : period as GoalPeriod,
      startDate:
          startDate == freezed ? _value.startDate : startDate as GoalDate,
      endDate: endDate == freezed ? _value.endDate : endDate as GoalDate,
      startPledge: startPledge == freezed
          ? _value.startPledge
          : startPledge as GoalPledge,
      endPledge:
          endPledge == freezed ? _value.endPledge : endPledge as GoalPledge,
      startPause:
          startPause == freezed ? _value.startPause : startPause as GoalDate,
      endPause: endPause == freezed ? _value.endPause : endPause as GoalDate,
    ));
  }
}

/// @nodoc
class _$_Goal with DiagnosticableTreeMixin implements _Goal {
  _$_Goal(
      {@required this.id,
      @required this.name,
      @required this.toReach,
      @required this.type,
      @required this.period,
      @required this.startDate,
      this.endDate,
      this.startPledge,
      this.endPledge,
      this.startPause,
      this.endPause})
      : assert(id != null),
        assert(name != null),
        assert(toReach != null),
        assert(type != null),
        assert(period != null),
        assert(startDate != null);

  @override
  final UniqueId id;
  @override
  final GoalName name;
  @override
  final bool toReach;
  @override
  final GoalType type;
  @override
  final GoalPeriod period;
  @override
  final GoalDate startDate;
  @override
  final GoalDate endDate;
  @override
  final GoalPledge startPledge;
  @override
  final GoalPledge endPledge;
  @override
  final GoalDate startPause;
  @override
  final GoalDate endPause;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Goal(id: $id, name: $name, toReach: $toReach, type: $type, period: $period, startDate: $startDate, endDate: $endDate, startPledge: $startPledge, endPledge: $endPledge, startPause: $startPause, endPause: $endPause)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Goal'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('toReach', toReach))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('period', period))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('startPledge', startPledge))
      ..add(DiagnosticsProperty('endPledge', endPledge))
      ..add(DiagnosticsProperty('startPause', startPause))
      ..add(DiagnosticsProperty('endPause', endPause));
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
                const DeepCollectionEquality()
                    .equals(other.toReach, toReach)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.startPledge, startPledge) ||
                const DeepCollectionEquality()
                    .equals(other.startPledge, startPledge)) &&
            (identical(other.endPledge, endPledge) ||
                const DeepCollectionEquality()
                    .equals(other.endPledge, endPledge)) &&
            (identical(other.startPause, startPause) ||
                const DeepCollectionEquality()
                    .equals(other.startPause, startPause)) &&
            (identical(other.endPause, endPause) ||
                const DeepCollectionEquality()
                    .equals(other.endPause, endPause)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(toReach) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(startPledge) ^
      const DeepCollectionEquality().hash(endPledge) ^
      const DeepCollectionEquality().hash(startPause) ^
      const DeepCollectionEquality().hash(endPause);

  @JsonKey(ignore: true)
  @override
  _$GoalCopyWith<_Goal> get copyWith =>
      __$GoalCopyWithImpl<_Goal>(this, _$identity);
}

abstract class _Goal implements Goal {
  factory _Goal(
      {@required UniqueId id,
      @required GoalName name,
      @required bool toReach,
      @required GoalType type,
      @required GoalPeriod period,
      @required GoalDate startDate,
      GoalDate endDate,
      GoalPledge startPledge,
      GoalPledge endPledge,
      GoalDate startPause,
      GoalDate endPause}) = _$_Goal;

  @override
  UniqueId get id;
  @override
  GoalName get name;
  @override
  bool get toReach;
  @override
  GoalType get type;
  @override
  GoalPeriod get period;
  @override
  GoalDate get startDate;
  @override
  GoalDate get endDate;
  @override
  GoalPledge get startPledge;
  @override
  GoalPledge get endPledge;
  @override
  GoalDate get startPause;
  @override
  GoalDate get endPause;
  @override
  @JsonKey(ignore: true)
  _$GoalCopyWith<_Goal> get copyWith;
}
