import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

enum AppColors { background, accent, white, black, grey }

extension AppColorsExtension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.background:
        return const Color.fromARGB(255, 29, 26, 26);
      case AppColors.accent:
        return const Color.fromARGB(255, 176, 70, 119);
      case AppColors.grey:
        return const Color.fromARGB(255, 58, 57, 57);
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
  Images.appIcon: 'assets/sound.png',
  Images.facebookIcon: 'assets/facebook.png',
  Images.googleIcon: 'assets/google.png',
  Images.appleIcon: 'assets/apple.png',
};
