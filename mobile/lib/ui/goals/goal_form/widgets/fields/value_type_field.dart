// Flutter imports:
import 'package:flutter/material.dart';

class ValueTypeField extends StatefulWidget {
  @override
  _ValueTypeFieldState createState() => _ValueTypeFieldState();
}

class _ValueTypeFieldState extends State<ValueTypeField> {
  bool isToReach;

  @override
  void initState() {
    super.initState();
    isToReach = true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Type:"),
        const Spacer(),
        Radio<bool>(
            value: true,
            groupValue: isToReach,
            onChanged: (bool value) {
              setState(() {
                isToReach = value;
              });
            }),
        GestureDetector(
          onTap: () {
            setState(() {
              isToReach = true;
            });
          },
          child: const Text("A atteindre"),
        ),
        Radio<bool>(
            value: false,
            groupValue: isToReach,
            onChanged: (bool value) {
              setState(() {
                isToReach = value;
              });
            }),
        GestureDetector(
          onTap: () {
            setState(() {
              isToReach = false;
            });
          },
          child: const Text("A ne pas dépasser"),
        ),
      ],
    );
  }
}
