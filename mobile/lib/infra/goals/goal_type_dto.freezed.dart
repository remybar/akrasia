// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'goal_type_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GoalTypeDTO _$GoalTypeDTOFromJson(Map<String, dynamic> json) {
  return _GoalTypeDTO.fromJson(json);
}

/// @nodoc
class _$GoalTypeDTOTearOff {
  const _$GoalTypeDTOTearOff();

// ignore: unused_element
  _GoalTypeDTO call({@required String name, double value, String unit}) {
    return _GoalTypeDTO(
      name: name,
      value: value,
      unit: unit,
    );
  }

// ignore: unused_element
  GoalTypeDTO fromJson(Map<String, Object> json) {
    return GoalTypeDTO.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GoalTypeDTO = _$GoalTypeDTOTearOff();

/// @nodoc
mixin _$GoalTypeDTO {
  String get name;
  double get value;
  String get unit;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GoalTypeDTOCopyWith<GoalTypeDTO> get copyWith;
}

/// @nodoc
abstract class $GoalTypeDTOCopyWith<$Res> {
  factory $GoalTypeDTOCopyWith(
          GoalTypeDTO value, $Res Function(GoalTypeDTO) then) =
      _$GoalTypeDTOCopyWithImpl<$Res>;
  $Res call({String name, double value, String unit});
}

/// @nodoc
class _$GoalTypeDTOCopyWithImpl<$Res> implements $GoalTypeDTOCopyWith<$Res> {
  _$GoalTypeDTOCopyWithImpl(this._value, this._then);

  final GoalTypeDTO _value;
  // ignore: unused_field
  final $Res Function(GoalTypeDTO) _then;

  @override
  $Res call({
    Object name = freezed,
    Object value = freezed,
    Object unit = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      value: value == freezed ? _value.value : value as double,
      unit: unit == freezed ? _value.unit : unit as String,
    ));
  }
}

/// @nodoc
abstract class _$GoalTypeDTOCopyWith<$Res>
    implements $GoalTypeDTOCopyWith<$Res> {
  factory _$GoalTypeDTOCopyWith(
          _GoalTypeDTO value, $Res Function(_GoalTypeDTO) then) =
      __$GoalTypeDTOCopyWithImpl<$Res>;
  @override
  $Res call({String name, double value, String unit});
}

/// @nodoc
class __$GoalTypeDTOCopyWithImpl<$Res> extends _$GoalTypeDTOCopyWithImpl<$Res>
    implements _$GoalTypeDTOCopyWith<$Res> {
  __$GoalTypeDTOCopyWithImpl(
      _GoalTypeDTO _value, $Res Function(_GoalTypeDTO) _then)
      : super(_value, (v) => _then(v as _GoalTypeDTO));

  @override
  _GoalTypeDTO get _value => super._value as _GoalTypeDTO;

  @override
  $Res call({
    Object name = freezed,
    Object value = freezed,
    Object unit = freezed,
  }) {
    return _then(_GoalTypeDTO(
      name: name == freezed ? _value.name : name as String,
      value: value == freezed ? _value.value : value as double,
      unit: unit == freezed ? _value.unit : unit as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GoalTypeDTO implements _GoalTypeDTO {
  const _$_GoalTypeDTO({@required this.name, this.value, this.unit})
      : assert(name != null);

  factory _$_GoalTypeDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_GoalTypeDTOFromJson(json);

  @override
  final String name;
  @override
  final double value;
  @override
  final String unit;

  @override
  String toString() {
    return 'GoalTypeDTO(name: $name, value: $value, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoalTypeDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(unit);

  @JsonKey(ignore: true)
  @override
  _$GoalTypeDTOCopyWith<_GoalTypeDTO> get copyWith =>
      __$GoalTypeDTOCopyWithImpl<_GoalTypeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GoalTypeDTOToJson(this);
  }
}

abstract class _GoalTypeDTO implements GoalTypeDTO {
  const factory _GoalTypeDTO(
      {@required String name, double value, String unit}) = _$_GoalTypeDTO;

  factory _GoalTypeDTO.fromJson(Map<String, dynamic> json) =
      _$_GoalTypeDTO.fromJson;

  @override
  String get name;
  @override
  double get value;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$GoalTypeDTOCopyWith<_GoalTypeDTO> get copyWith;
}
