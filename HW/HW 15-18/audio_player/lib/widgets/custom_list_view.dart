import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CustomListViewContent extends StatelessWidget {
  const CustomListViewContent(
      {super.key, required this.imageSection, required this.titleSection});
  final Widget imageSection;
  final Widget titleSection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                imageSection,
                ResponsiveBuilder(
                    narrow: 100.0,
                    medium: 170.0,
                    large: 300.0,
                    builder: (context, child, size) {
                      return SizedBox(width: size, child: titleSection);
                    }),
              ],
            ),
            IconButtonWidget(
                iconData: Icons.keyboard_control,
                color: AppColors.white.color,
                onPressed: () {}),
          ]),
    );
  }
}
