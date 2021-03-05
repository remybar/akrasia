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
      {@required @JsonKey(ignore: true) String id,
      @required String name,
      @required bool toReach}) {
    return _GoalDTO(
      id: id,
      name: name,
      toReach: toReach,
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

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GoalDTOCopyWith<GoalDTO> get copyWith;
}

/// @nodoc
abstract class $GoalDTOCopyWith<$Res> {
  factory $GoalDTOCopyWith(GoalDTO value, $Res Function(GoalDTO) then) =
      _$GoalDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(ignore: true) String id, String name, bool toReach});
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
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      toReach: toReach == freezed ? _value.toReach : toReach as bool,
    ));
  }
}

/// @nodoc
abstract class _$GoalDTOCopyWith<$Res> implements $GoalDTOCopyWith<$Res> {
  factory _$GoalDTOCopyWith(_GoalDTO value, $Res Function(_GoalDTO) then) =
      __$GoalDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(ignore: true) String id, String name, bool toReach});
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
  }) {
    return _then(_GoalDTO(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      toReach: toReach == freezed ? _value.toReach : toReach as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GoalDTO implements _GoalDTO {
  _$_GoalDTO(
      {@required @JsonKey(ignore: true) this.id,
      @required this.name,
      @required this.toReach})
      : assert(id != null),
        assert(name != null),
        assert(toReach != null);

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
  String toString() {
    return 'GoalDTO(id: $id, name: $name, toReach: $toReach)';
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
  _$GoalDTOCopyWith<_GoalDTO> get copyWith =>
      __$GoalDTOCopyWithImpl<_GoalDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GoalDTOToJson(this);
  }
}

abstract class _GoalDTO implements GoalDTO {
  factory _GoalDTO(
      {@required @JsonKey(ignore: true) String id,
      @required String name,
      @required bool toReach}) = _$_GoalDTO;

  factory _GoalDTO.fromJson(Map<String, dynamic> json) = _$_GoalDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get name;
  @override
  bool get toReach;
  @override
  @JsonKey(ignore: true)
  _$GoalDTOCopyWith<_GoalDTO> get copyWith;
}
