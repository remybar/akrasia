// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:akrasia/domain/goals/goal_state.dart';
import 'package:akrasia/domain/goals/goal.dart';

abstract class GoalCardDataValue extends StatelessWidget {
  final GoalState goalState;
  final DateTime selectedDate;
  const GoalCardDataValue({Key key, this.goalState, this.selectedDate}) : super(key: key);

  Widget buildInProgressDataValue(BuildContext context);

  Widget _buildNotStartedDataValue(DateTime startDate) {
    return InactiveDataValueWidget(
      child: Column(
        children: [
          Text(DateFormat("d EEE").format(startDate), style: const TextStyle(fontSize: 8)),
          Text(DateFormat.y().format(startDate), style: const TextStyle(fontSize: 8))
        ],
      ),
    );
  }

  Widget _buildFinishedDataValue() {
    return const InactiveDataValueWidget(child: Icon(Icons.check));
  }

  @override
  Widget build(BuildContext context) {
    // NOT STARTED
    if (!goalState.goal.isStarted(selectedDate)) {
      return _buildNotStartedDataValue(goalState.goal.startDate.getOrCrash());
    }

    // FINISHED
    if (goalState.goal.isFinished(selectedDate)) {
      return _buildFinishedDataValue();
    }

    // IN PROGRESS
    return buildInProgressDataValue(context);
  }
}

// Widget _buildActiveDataValue(BuildContext context) {
//   Widget child;
//   switch (widget.goal.dataKind) {
//     case DataKind.CountData:
//       child = Icon(Icons.add);
//       fillColor = Colors.green;
//       break;
//     case DataKind.ManualData:
//       child = Icon(Icons.edit);
//       break;
//     case DataKind.AppData:
//       child = Icon(Icons.phone_android);
//       break;
//     case DataKind.TimerData:
//       child = active ? Icon(Icons.pause) : Icon(Icons.play_arrow);
//       fillColor = Colors.green;
//       break;
//     case DataKind.YesNoData:
//     default:
//       child = active ? Icon(Icons.check) : Container();
//       fillColor = active ? Colors.green : backgroundColor;
//       borderColor = active ? Colors.green : Colors.blueGrey[600];
//       borderWidth = 3;
//   }
// }

class ActiveDataValueWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Color fillColor;
  final Color borderColor;
  final bool hasBorder;
  final Widget child;

  const ActiveDataValueWidget({
    Key key,
    this.onPressed,
    this.fillColor,
    this.borderColor,
    this.hasBorder,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: RawMaterialButton(
        onPressed: onPressed,
        textStyle: const TextStyle(color: Colors.white),
        fillColor: fillColor,
        constraints: const BoxConstraints(minWidth: 36.0, minHeight: 36.0),
        padding: const EdgeInsets.all(5.0),
        shape: CircleBorder(side: BorderSide(color: borderColor, width: hasBorder ? 3.0 : 0.0)),
        child: child,
      ),
    );
  }
}

class InactiveDataValueWidget extends StatelessWidget {
  final Widget child;

  const InactiveDataValueWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: RawMaterialButton(
        onPressed: null,
        textStyle: const TextStyle(color: Colors.black87),
        fillColor: Colors.blueGrey[100],
        constraints: const BoxConstraints(minWidth: 36.0, minHeight: 36.0),
        padding: const EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
