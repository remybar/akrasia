import 'package:flutter/material.dart';

import 'package:akrasia/ui/core/widgets/custom_bottom_sheet.dart';
import 'package:akrasia/ui/goals/goal_form/widgets/configurators/pledge_field_configurator.dart';

class GoalPledgeField extends StatelessWidget {
  final String title = "Gage";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "Départ: 5€    Plafond: 40€",
      decoration: InputDecoration(
        labelText: title,
      ),
      readOnly: true,
      onTap: () {
        showCustomBottomSheet(title: title, child: PledgeFieldConfigurator(), context: context, onValidate: () {});
      },
    );
  }
}
