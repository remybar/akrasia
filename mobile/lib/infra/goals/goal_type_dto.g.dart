// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoalTypeDTO _$_$_GoalTypeDTOFromJson(Map<String, dynamic> json) {
  return _$_GoalTypeDTO(
    name: json['name'] as String,
    value: (json['value'] as num)?.toDouble(),
    unit: json['unit'] as String,
  );
}

Map<String, dynamic> _$_$_GoalTypeDTOToJson(_$_GoalTypeDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  writeNotNull('unit', instance.unit);
  return val;
}
