import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final Color bgColor;
  final Color fgColor;
  final String text;
  final double fontSize;

  TagWidget({this.bgColor, this.fgColor, this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(width: 1.0, color: fgColor),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500, color: fgColor)));
  }
}
