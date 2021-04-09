// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

// Project imports:
import 'package:akrasia/domain/goals/value_objects/goal_data_value.dart';

part 'goal_data.freezed.dart';

@freezed
abstract class GoalData with _$GoalData {
  const factory GoalData({
    @required DateTime date,
    @required GoalDataValue value,
  }) = _GoalData;
}

extension GoalDataX on KtList<GoalData> {
  GoalDataValue sum() {
    if (all((data) => data.value is IntegerData)) {
      return GoalDataValue.integerData(
        value: sumBy(
          (data) => data.value.when(integerData: (d) => d.value, doubleData: (_) => null),
        ),
      );
    }
    if (all((data) => data.value is DoubleData)) {
      return GoalDataValue.doubleData(
        value: sumByDouble(
          (data) => data.value.when(integerData: (_) => null, doubleData: (d) => d.value),
        ),
      );
    }
    return null;
  }
}
