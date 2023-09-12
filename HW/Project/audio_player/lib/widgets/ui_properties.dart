import 'package:flutter/material.dart';

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
        return const Color.fromARGB(255, 122, 15, 56);
      case AppColors.black:
        return Colors.black;
      default:
        return const Color.fromARGB(255, 239, 237, 237);
    }
  }
}

enum Images {
  appleIcon,
  facebookIcon,
  googleIcon,
  appIcon,
}

Map<Images, String> imagesMap = {
  Images.appIcon: 'assets/images/sound.png',
  Images.facebookIcon: 'assets/images/facebook.png',
  Images.googleIcon: 'assets/images/google.png',
  Images.appleIcon: 'assets/images/apple.png',
};

const String defaultImage =
    'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg';
