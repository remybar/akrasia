import 'package:flutter/material.dart';

import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/counter_data_configurator.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/timer_data_configurator.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/app_data_configurator.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/manual_data_configurator.dart';

enum DataKind { YesNoData, CountData, TimerData, AppData, ManualData }

class DataFieldConfigurator extends StatefulWidget {
  @override
  _DataFieldConfiguratorState createState() => _DataFieldConfiguratorState();
}

class _DataFieldConfiguratorState extends State<DataFieldConfigurator> {
  DataKind selectedDataKind;

  @override
  void initState() {
    super.initState();
    selectedDataKind = null;
  }

  void setSelectedDataKind(DataKind kind) {
    setState(() {
      selectedDataKind = kind;
    });
  }

  Widget _buildRadio({String title, String subtitle, IconData icon, VoidCallback onPressed, bool bNext = true}) {
    return Container(
        margin: EdgeInsets.all(5),
        child: FlatButton(
          padding: EdgeInsets.all(8),
          child: Row(children: [
            Icon(icon, color: Colors.deepPurple),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.normal))
            ]),
            Spacer(),
            bNext ? Icon(Icons.arrow_forward_ios, color: Colors.deepPurple) : Container()
          ]),
          onPressed: onPressed,
        ));
  }

  Widget _buildYesNoData(context) {
    return _buildRadio(
        title: "Oui/Non",
        subtitle: "à faire une fois par période",
        icon: Icons.check,
        onPressed: () {
//          Navigator.pop(context);
        },
        bNext: false);
  }

  Widget _buildCountData(BuildContext context) {
    return _buildRadio(
        title: "Compteur",
        subtitle: "à faire plusieurs fois par période",
        icon: Icons.exposure_plus_1,
        onPressed: () {
//          Navigator.pop(context);
          showCustomBottomSheet(
              title: "Compteur", child: CounterDataConfigurator(), context: context, onValidate: () {});
        });
  }

  Widget _buildTimerData(BuildContext context) {
    return _buildRadio(
        title: "Timer",
        subtitle: "basé sur le temps passé",
        icon: Icons.access_alarms_sharp,
        onPressed: () {
//          Navigator.pop(context);
          showCustomBottomSheet(title: "Timer", child: TimerDataConfigurator(), context: context, onValidate: () {});
        });
  }

  Widget _buildAppData(BuildContext context) {
    return _buildRadio(
        title: "A partir d'une application",
        subtitle: "la mise à jour est automatique",
        icon: Icons.mobile_friendly,
        onPressed: () {
//          Navigator.pop(context);
          showCustomBottomSheet(
              title: "Application", child: AppDataConfigurator(), context: context, onValidate: () {});
        });
  }

  Widget _buildManualData(BuildContext context) {
    return _buildRadio(
        title: "Valeur manuelle",
        subtitle: "pour n'importe quelle autre valeur",
        icon: Icons.keyboard,
        onPressed: () {
//          Navigator.pop(context);
          showCustomBottomSheet(
              title: "Manuelle", child: ManualDataConfigurator(), context: context, onValidate: () {});
        });
  }

  Widget _buildDataKindSelectionScreen(BuildContext context) {
    return Column(
      children: [
        _buildYesNoData(context),
        Divider(),
        _buildCountData(context),
        Divider(),
        _buildTimerData(context),
        Divider(),
        _buildAppData(context),
        Divider(),
        _buildManualData(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDataKindSelectionScreen(context);
  }
}
