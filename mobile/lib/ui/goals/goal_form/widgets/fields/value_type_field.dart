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
        Text("Type:"),
        Spacer(),
        Radio<bool>(
            value: true,
            groupValue: isToReach,
            onChanged: (bool value) {
              setState(() {
                isToReach = value;
              });
            }),
        GestureDetector(
            child: Text("A atteindre"),
            onTap: () {
              setState(() {
                isToReach = true;
              });
            }),
        Radio<bool>(
            value: false,
            groupValue: isToReach,
            onChanged: (bool value) {
              setState(() {
                isToReach = value;
              });
            }),
        GestureDetector(
            child: Text("A ne pas dépasser"),
            onTap: () {
              setState(() {
                isToReach = false;
              });
            }),
      ],
    );
  }
}
