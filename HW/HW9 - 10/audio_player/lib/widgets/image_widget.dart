import 'package:flutter/widgets.dart';

class ImageinAlbum extends StatelessWidget {
  final double size;
  final Widget image;
  final String type;
  const ImageinAlbum(
      {super.key, required this.size, required this.type, required this.image});
  @override
  Widget build(BuildContext context) {
    if (type == 'track') {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16 / 2),
          child: SizedBox(width: size, height: size, child: image),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: SizedBox(width: size, height: size, child: image),
        ),
      );
    }
  }
}
