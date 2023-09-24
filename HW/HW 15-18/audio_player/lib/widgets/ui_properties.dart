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
        return 'PoiretOne';
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
  defaultImage,
  userPhoto,
  track,
  album,
  playlist
}

Map<Images, String> imagesMap = {
  Images.appIcon: 'assets/images/sound_logo.png',
  Images.facebookIcon: 'assets/images/facebook.png',
  Images.googleIcon: 'assets/images/google.png',
  Images.appleIcon: 'assets/images/apple.png',
  Images.album: 'assets/images/album.png',
  Images.track: 'assets/images/track.png',
  Images.playlist: 'assets/images/playlist.png',
  Images.defaultImage:
      'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg',
  Images.userPhoto:
      'https://static.vecteezy.com/system/resources/thumbnails/019/879/186/small/user-icon-on-transparent-background-free-png.png',
};
