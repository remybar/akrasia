// Package imports:
import 'package:super_enum/super_enum.dart';

part 'goal_data_value.super.dart';

@superEnum
enum _GoalDataValue {
  @Data(fields: [DataField<int>('value')])
  // ignore: constant_identifier_names
  IntegerData,

  @Data(fields: [DataField<double>('value')])
  // ignore: constant_identifier_names
  DoubleData,
}
