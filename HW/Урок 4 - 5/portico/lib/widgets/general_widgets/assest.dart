enum Assets {
  art1,
  art2,
  art3,
  blackSquare,
  cold,
  flowers,
  girls,
  liquid,
  naturalness,
  nature,
  pencil,
  retouch,
  roversi,
  subscribtion,
  user
}

extension AssetsExtension on Assets {
  String get asset {
    switch (this) {
      case Assets.art1:
        return 'assets/images/art1.JPG';
      case Assets.art2:
        return 'assets/images/art2.JPG';
      case Assets.art3:
        return 'assets/images/art3.JPG';
      case Assets.blackSquare:
        return 'assets/images/Black.jpg';
      case Assets.cold:
        return 'assets/images/Cold.JPG';
      case Assets.flowers:
        return 'assets/images/Flowers.JPG';
      case Assets.girls:
        return 'assets/images/Girls.JPG';
      case Assets.liquid:
        return 'assets/images/Liquid.JPG';
      case Assets.naturalness:
        return 'assets/images/Naturalness.JPG';
      case Assets.nature:
        return 'assets/images/Nature.JPG';
      case Assets.pencil:
        return 'assets/images/pencil.png';
      case Assets.retouch:
        return 'assets/images/Retouch.JPG';
      case Assets.roversi:
        return 'assets/images/Roversi.JPG';
      case Assets.subscribtion:
        return 'assets/images/subscribtion.png';
      default:
        return 'assets/images/user.png';
    }
  }
}
