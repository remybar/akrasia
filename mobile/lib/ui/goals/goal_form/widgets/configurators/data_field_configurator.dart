// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/goals/goal_form/goal_form_bloc.dart';
import 'package:akrasia/domain/goals/value_objects/goal_type.dart';
import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/app_data_configurator.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/configurators.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/counter_data_configurator.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/manual_data_configurator.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/timer_data_configurator.dart';

class DataFieldConfigurator extends StatelessWidget {
  final GoalType initialType;
  final bool toReach;

  const DataFieldConfigurator({Key key, this.initialType, this.toReach}) : super(key: key);

  Widget _buildYesNoData(BuildContext context) {
    return _RadioWidget(
        title: "Oui/Non",
        subtitle: "à faire une fois par période",
        icon: Icons.check,
        onPressed: () {
          context.read<GoalFormBloc>().add(
                GoalFormEvent.typeChanged(GoalType.yesNoGoal()),
              );
          Navigator.pop(context);
        },
        bNext: false);
  }

  Widget _buildCountData(BuildContext context) {
    const String title = 'Compteur';
    return _RadioWidget(
        title: title,
        subtitle: "à faire plusieurs fois par période",
        icon: Icons.exposure_plus_1,
        onPressed: () {
          Navigator.pop(context);
          showConfigurator(
            context: context,
            value: BlocProvider.of<GoalFormBloc>(context),
            child: CounterDataConfigurator(
              title: title,
              initialType: initialType.whenOrElse(
                countGoal: (_) => initialType,
                orElse: (_) => GoalTypeX.defaultCountGoal(),
              ),
            ),
          );
        });
  }

  Widget _buildTimerData(BuildContext context) {
    const String title = 'Timer';
    return _RadioWidget(
        title: title,
        subtitle: "basé sur le temps passé",
        icon: Icons.access_alarms_sharp,
        onPressed: () {
          Navigator.pop(context);
          showConfigurator(
            context: context,
            value: BlocProvider.of<GoalFormBloc>(context),
            child: TimerDataConfigurator(
              title: title,
              initialType: initialType.whenOrElse(
                timerGoal: (_) => initialType,
                orElse: (_) => GoalTypeX.defaultTimeGoal(),
              ),
            ),
          );
        });
  }

  Widget _buildAppData(BuildContext context) {
    const String title = "A partir d'une application";
    return _RadioWidget(
        title: title,
        subtitle: "la mise à jour est automatique",
        icon: Icons.mobile_friendly,
        onPressed: () {
          Navigator.pop(context);
          showConfigurator(
            context: context,
            value: BlocProvider.of<GoalFormBloc>(context),
            child: AppDataConfigurator(
              initialType: GoalTypeX.defaultValueGoal(),
            ),
          );
        });
  }

  Widget _buildManualData(BuildContext context) {
    const String title = "Valeur manuelle";
    return _RadioWidget(
        title: title,
        subtitle: "pour n'importe quelle autre valeur",
        icon: Icons.keyboard,
        onPressed: () {
          Navigator.pop(context);
          showConfigurator(
            context: context,
            value: BlocProvider.of<GoalFormBloc>(context),
            child: ManualDataConfigurator(
              title: title,
              initialType: initialType.whenOrElse(
                valueGoal: (_) => initialType,
                orElse: (_) => GoalTypeX.defaultValueGoal(),
              ),
            ),
          );
        });
  }

  Widget _buildDataKindSelectionScreen(BuildContext context) {
    return Column(
      children: [
        _buildYesNoData(context),
        const Divider(),
        _buildCountData(context),
        const Divider(),
        _buildTimerData(context),
        const Divider(),
        _buildAppData(context),
        const Divider(),
        _buildManualData(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'Données',
      child: Column(
        children: [
          _buildDataKindSelectionScreen(context),
        ],
      ),
    );
  }
}

class _RadioWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;
  final bool bNext;

  const _RadioWidget({Key key, this.title, this.subtitle, this.icon, this.onPressed, this.bNext = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: onPressed,
          child: Row(children: [
            Icon(icon, color: Colors.deepPurple),
            const SizedBox(width: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.normal),
              )
            ]),
            const Spacer(),
            if (bNext) const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple)
          ]),
        ));
  }
}
