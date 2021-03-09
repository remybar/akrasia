// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'goal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GoalDTO _$GoalDTOFromJson(Map<String, dynamic> json) {
  return _GoalDTO.fromJson(json);
}

/// @nodoc
class _$GoalDTOTearOff {
  const _$GoalDTOTearOff();

// ignore: unused_element
  _GoalDTO call(
      {@JsonKey(ignore: true)
          String id,
      @required
          String name,
      @required
          bool toReach,
      @required
          GoalTypeDTO type,
      @required
      @JsonKey(fromJson: GoalDTO._strToPeriod, toJson: GoalDTO._periodToStr)
          GoalPeriod period,
      @required
          DateTime startDate,
      DateTime endDate,
      int startPledge,
      int endPledge,
      DateTime startPause,
      DateTime endPause}) {
    return _GoalDTO(
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

// ignore: unused_element
  GoalDTO fromJson(Map<String, Object> json) {
    return GoalDTO.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GoalDTO = _$GoalDTOTearOff();

/// @nodoc
mixin _$GoalDTO {
  @JsonKey(ignore: true)
  String get id;
  String get name;
  bool get toReach;
  GoalTypeDTO get type;
  @JsonKey(fromJson: GoalDTO._strToPeriod, toJson: GoalDTO._periodToStr)
  GoalPeriod get period;
  DateTime get startDate;
  DateTime get endDate;
  int get startPledge;
  int get endPledge;
  DateTime get startPause;
  DateTime get endPause;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GoalDTOCopyWith<GoalDTO> get copyWith;
}

/// @nodoc
abstract class $GoalDTOCopyWith<$Res> {
  factory $GoalDTOCopyWith(GoalDTO value, $Res Function(GoalDTO) then) =
      _$GoalDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true)
          String id,
      String name,
      bool toReach,
      GoalTypeDTO type,
      @JsonKey(fromJson: GoalDTO._strToPeriod, toJson: GoalDTO._periodToStr)
          GoalPeriod period,
      DateTime startDate,
      DateTime endDate,
      int startPledge,
      int endPledge,
      DateTime startPause,
      DateTime endPause});

  $GoalTypeDTOCopyWith<$Res> get type;
}

/// @nodoc
class _$GoalDTOCopyWithImpl<$Res> implements $GoalDTOCopyWith<$Res> {
  _$GoalDTOCopyWithImpl(this._value, this._then);

  final GoalDTO _value;
  // ignore: unused_field
  final $Res Function(GoalDTO) _then;

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
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      toReach: toReach == freezed ? _value.toReach : toReach as bool,
      type: type == freezed ? _value.type : type as GoalTypeDTO,
      period: period == freezed ? _value.period : period as GoalPeriod,
      startDate:
          startDate == freezed ? _value.startDate : startDate as DateTime,
      endDate: endDate == freezed ? _value.endDate : endDate as DateTime,
      startPledge:
          startPledge == freezed ? _value.startPledge : startPledge as int,
      endPledge: endPledge == freezed ? _value.endPledge : endPledge as int,
      startPause:
          startPause == freezed ? _value.startPause : startPause as DateTime,
      endPause: endPause == freezed ? _value.endPause : endPause as DateTime,
    ));
  }

  @override
  $GoalTypeDTOCopyWith<$Res> get type {
    if (_value.type == null) {
      return null;
    }
    return $GoalTypeDTOCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc
abstract class _$GoalDTOCopyWith<$Res> implements $GoalDTOCopyWith<$Res> {
  factory _$GoalDTOCopyWith(_GoalDTO value, $Res Function(_GoalDTO) then) =
      __$GoalDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true)
          String id,
      String name,
      bool toReach,
      GoalTypeDTO type,
      @JsonKey(fromJson: GoalDTO._strToPeriod, toJson: GoalDTO._periodToStr)
          GoalPeriod period,
      DateTime startDate,
      DateTime endDate,
      int startPledge,
      int endPledge,
      DateTime startPause,
      DateTime endPause});

  @override
  $GoalTypeDTOCopyWith<$Res> get type;
}

/// @nodoc
class __$GoalDTOCopyWithImpl<$Res> extends _$GoalDTOCopyWithImpl<$Res>
    implements _$GoalDTOCopyWith<$Res> {
  __$GoalDTOCopyWithImpl(_GoalDTO _value, $Res Function(_GoalDTO) _then)
      : super(_value, (v) => _then(v as _GoalDTO));

  @override
  _GoalDTO get _value => super._value as _GoalDTO;

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
    return _then(_GoalDTO(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      toReach: toReach == freezed ? _value.toReach : toReach as bool,
      type: type == freezed ? _value.type : type as GoalTypeDTO,
      period: period == freezed ? _value.period : period as GoalPeriod,
      startDate:
          startDate == freezed ? _value.startDate : startDate as DateTime,
      endDate: endDate == freezed ? _value.endDate : endDate as DateTime,
      startPledge:
          startPledge == freezed ? _value.startPledge : startPledge as int,
      endPledge: endPledge == freezed ? _value.endPledge : endPledge as int,
      startPause:
          startPause == freezed ? _value.startPause : startPause as DateTime,
      endPause: endPause == freezed ? _value.endPause : endPause as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GoalDTO implements _GoalDTO {
  _$_GoalDTO(
      {@JsonKey(ignore: true)
          this.id,
      @required
          this.name,
      @required
          this.toReach,
      @required
          this.type,
      @required
      @JsonKey(fromJson: GoalDTO._strToPeriod, toJson: GoalDTO._periodToStr)
          this.period,
      @required
          this.startDate,
      this.endDate,
      this.startPledge,
      this.endPledge,
      this.startPause,
      this.endPause})
      : assert(name != null),
        assert(toReach != null),
        assert(type != null),
        assert(period != null),
        assert(startDate != null);

  factory _$_GoalDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_GoalDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String name;
  @override
  final bool toReach;
  @override
  final GoalTypeDTO type;
  @override
  @JsonKey(fromJson: GoalDTO._strToPeriod, toJson: GoalDTO._periodToStr)
  final GoalPeriod period;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int startPledge;
  @override
  final int endPledge;
  @override
  final DateTime startPause;
  @override
  final DateTime endPause;

  @override
  String toString() {
    return 'GoalDTO(id: $id, name: $name, toReach: $toReach, type: $type, period: $period, startDate: $startDate, endDate: $endDate, startPledge: $startPledge, endPledge: $endPledge, startPause: $startPause, endPause: $endPause)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoalDTO &&
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
  _$GoalDTOCopyWith<_GoalDTO> get copyWith =>
      __$GoalDTOCopyWithImpl<_GoalDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GoalDTOToJson(this);
  }
}

abstract class _GoalDTO implements GoalDTO {
  factory _GoalDTO(
      {@JsonKey(ignore: true)
          String id,
      @required
          String name,
      @required
          bool toReach,
      @required
          GoalTypeDTO type,
      @required
      @JsonKey(fromJson: GoalDTO._strToPeriod, toJson: GoalDTO._periodToStr)
          GoalPeriod period,
      @required
          DateTime startDate,
      DateTime endDate,
      int startPledge,
      int endPledge,
      DateTime startPause,
      DateTime endPause}) = _$_GoalDTO;

  factory _GoalDTO.fromJson(Map<String, dynamic> json) = _$_GoalDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get name;
  @override
  bool get toReach;
  @override
  GoalTypeDTO get type;
  @override
  @JsonKey(fromJson: GoalDTO._strToPeriod, toJson: GoalDTO._periodToStr)
  GoalPeriod get period;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get startPledge;
  @override
  int get endPledge;
  @override
  DateTime get startPause;
  @override
  DateTime get endPause;
  @override
  @JsonKey(ignore: true)
  _$GoalDTOCopyWith<_GoalDTO> get copyWith;
}
