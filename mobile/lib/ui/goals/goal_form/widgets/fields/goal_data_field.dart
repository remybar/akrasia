import 'package:flutter/material.dart';

import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/data_field_configurator.dart';

class GoalDataField extends StatelessWidget {
  final String title = "Données";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "Strava - 35km",
      decoration: InputDecoration(
        labelText: title,
      ),
      readOnly: true,
      onTap: () {
        showCustomBottomSheet(title: title, child: DataFieldConfigurator(), context: context, onValidate: () {});
      },
    );
  }
}
