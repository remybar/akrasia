// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';

class AppDataConfigurator extends StatefulWidget {
  final GoalType initialType;

  const AppDataConfigurator({Key key, this.initialType}) : super(key: key);

  @override
  _AppDataConfiguratorState createState() => _AppDataConfiguratorState();
}

class _AppDataConfiguratorState extends State<AppDataConfigurator> {
  GoalType currentType;

  @override
  void initState() {
    super.initState();
    currentType = widget.initialType;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
