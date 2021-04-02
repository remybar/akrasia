// Flutter imports:
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AkrasiaTheme {
  // TODO: toggle theme https://www.raywenderlich.com/16628777-theming-a-flutter-app-getting-started

  static ThemeData get dark {
    return ThemeData();
  }

  static ThemeData get light {
    return ThemeData(
      primaryColor: Colors.deepPurple[300],
      accentColor: Colors.blueAccent,
    );
  }
}

extension AkrasiaColorScheme on ColorScheme {
  Color get goalCardBgColor => brightness == Brightness.light ? Colors.blueGrey[50] : Colors.blueGrey[300];
}
