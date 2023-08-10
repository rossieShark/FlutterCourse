import 'package:flutter/material.dart';

export 'package:audio_player/widgets/custom_button.dart';
export 'package:audio_player/widgets/custom_indicator.dart';
export 'package:animate_gradient/animate_gradient.dart';

enum AppFonts { montserrat, lusitana, colombia }

extension AppFontsExtension on AppFonts {
  String get font {
    switch (this) {
      case AppFonts.montserrat:
        return "CormorantInfant";
      case AppFonts.lusitana:
        return 'Lusitana';
      default:
        return 'Colombia';
    }
  }
}

enum AppColors { background, accent, white, black, darkAccent }

extension AppColorsExtension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.background:
        return const Color.fromARGB(255, 25, 24, 24);
      case AppColors.accent:
        return const Color.fromARGB(255, 176, 70, 119);
      case AppColors.darkAccent:
        return const Color.fromARGB(255, 151, 33, 65);
      case AppColors.black:
        return Colors.black;
      default:
        return const Color.fromARGB(255, 239, 237, 237);
    }
  }
}
