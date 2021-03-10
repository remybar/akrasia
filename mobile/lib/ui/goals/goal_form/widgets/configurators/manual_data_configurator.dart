import 'package:flutter/material.dart';

import 'package:akrasia/ui/goals/goal_form/widgets/fields/value_type_field.dart';

class ManualDataConfigurator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueTypeField(),
        Row(
          children: [
            Text("Donnée:"),
            SizedBox(width: 10),
            Flexible(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Valeur", hintStyle: TextStyle(fontSize: 12)),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
                child: TextField(
              decoration: InputDecoration(hintText: "Unité (ex: km, pages...)", hintStyle: TextStyle(fontSize: 12)),
            ))
          ],
        )
      ],
    );
  }
}
