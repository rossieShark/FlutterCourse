import 'package:flutter/material.dart';

class AppColorData {
  static const Color grey = Color.fromARGB(255, 67, 68, 67);
  static const Color white = Color.fromARGB(255, 233, 233, 233);
  static const Color darkRed = Color.fromARGB(255, 79, 11, 3);
  static const Color blue = Color.fromARGB(255, 12, 5, 122);
  static const Color darkGrey = Color.fromARGB(255, 29, 30, 34);
  static const Color lightGrey = Color.fromARGB(255, 162, 162, 162);
}

enum AppFonts { asteria, cormorant, rosiebrown }

extension AppFontsExtension on AppFonts {
  String get font {
    switch (this) {
      case AppFonts.cormorant:
        return "CormorantInfant";
      case AppFonts.rosiebrown:
        return "Rosiebrown";
      default:
        return "Asteria";
    }
  }
}
