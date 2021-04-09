import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'goal.dart';
import 'goal_step.dart';

part 'goal_state.freezed.dart';

// a goal state represents the state of a goal at a specific date.
// this is mainly the association of a goal with one of its goal step if goal data have already been added
// for this goal at this date (according to the goal period) or null.
@freezed
abstract class GoalState with _$GoalState {
  const factory GoalState({@required Goal goal, GoalStep step}) = _GoalState;
}

extension GoalStateX on GoalState {
  // indicate if the goal target value has been reached according to the associated step and
  // whatever if it's a 'to reach' goal or not.
  bool isReached() {
    // no step = no data
    if (step == null) {
      return false;
    }

    final currentValue = step.getCurrentGoalValue();
    return (currentValue != null) &&
        goal.type.when(
          yesNoGoal: () => currentValue.whenOrElse(integerData: (d) => d.value > 0, orElse: (_) => null),
          countGoal: (data) => currentValue.whenOrElse(
            integerData: (d) => d.value >= data.countValue.getOrCrash(),
            orElse: (_) => null,
          ),
          timerGoal: (data) => currentValue.whenOrElse(
            integerData: (d) => d.value >= data.timeValue.getOrCrash(),
            orElse: (_) => null,
          ),
          valueGoal: (data) => currentValue.whenOrElse(
            doubleData: (d) => d.value >= data.value.getOrCrash(),
            orElse: (_) => null,
          ),
        );
  }

  // Indicate if the goal has been achieved.
  // That means:
  // - has reached the goal target value for a 'to reach' goal
  // - has NOT reached the goal target value otherwise
  bool isAchieved() {
    final bAchieved = isReached();
    return goal.toReach ? bAchieved : !bAchieved;
  }
}
