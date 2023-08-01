import 'package:flutter/material.dart';

enum AppFonts { gogol, montserrat, fontspring }

extension AppFontsExtension on AppFonts {
  String get font {
    switch (this) {
      case AppFonts.gogol:
        return "gogol";
      case AppFonts.montserrat:
        return "Montserrat";
      default:
        return "Fontspring";
    }
  }
}

enum AppImages { broccoli, userImage, loading }

extension AppImagesExtension on AppImages {
  String get image {
    switch (this) {
      case AppImages.broccoli:
        return "assets/images/broccoli.png";
      case AppImages.userImage:
        return "assets/images/user-profile.png";
      default:
        return "assets/images/loading.png";
    }
  }
}

enum AppColors { black, yellow, white }

extension AppColorsExtension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.black:
        return const Color.fromARGB(255, 15, 15, 13);
      case AppColors.yellow:
        return const Color.fromARGB(255, 247, 172, 33);
      default:
        return const Color.fromARGB(255, 239, 237, 237);
    }
  }
}
