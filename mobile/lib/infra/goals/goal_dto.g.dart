// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoalDTO _$_$_GoalDTOFromJson(Map<String, dynamic> json) {
  return _$_GoalDTO(
    name: json['name'] as String,
    toReach: json['toReach'] as bool,
    type: json['type'] == null
        ? null
        : GoalTypeDTO.fromJson(json['type'] as Map<String, dynamic>),
    period: GoalDTO._strToPeriod(json['period'] as String),
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    startPledge: json['startPledge'] as int,
    endPledge: json['endPledge'] as int,
    startPause: json['startPause'] == null
        ? null
        : DateTime.parse(json['startPause'] as String),
    endPause: json['endPause'] == null
        ? null
        : DateTime.parse(json['endPause'] as String),
  );
}

Map<String, dynamic> _$_$_GoalDTOToJson(_$_GoalDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('toReach', instance.toReach);
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('period', GoalDTO._periodToStr(instance.period));
  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  writeNotNull('startPledge', instance.startPledge);
  writeNotNull('endPledge', instance.endPledge);
  writeNotNull('startPause', instance.startPause?.toIso8601String());
  writeNotNull('endPause', instance.endPause?.toIso8601String());
  return val;
}
