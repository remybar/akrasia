import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:akrasia/ui/goals/goal_form/widgets/fields/value_type_field.dart';

class CounterDataConfigurator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueTypeField(),
        Row(
          children: [
            Container(child: Text("Valeur:"), width: 120),
            Flexible(
                child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ))
          ],
        )
      ],
    );
  }
}
