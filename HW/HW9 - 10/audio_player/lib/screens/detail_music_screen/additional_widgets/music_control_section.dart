import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreatMusicControlSection extends StatelessWidget {
  const CreatMusicControlSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        narrow: 280.0,
        medium: 320.0,
        large: 320.0,
        builder: (context, child, height) {
          return SizedBox(
            width: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonWidget(
                    iconData: Icons.repeat,
                    color: AppColors.accent.color,
                    onPressed: () {}),
                ResponsiveBuilder(
                    narrow: 50.0,
                    medium: 60.0,
                    large: 60.0,
                    builder: (context, child, height) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: height - 15,
                              width: height - 10,
                              decoration: BoxDecoration(
                                  color:
                                      AppColors.white.color.withOpacity(0.1)),
                              child: IconButtonWidget(
                                  iconData: Icons.fast_rewind,
                                  color: AppColors.white.color,
                                  onPressed: () {}),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: height,
                              width: height,
                              decoration:
                                  BoxDecoration(color: AppColors.accent.color),
                              child: IconButtonWidget(
                                  iconData: Icons.play_arrow,
                                  color: AppColors.white.color,
                                  size: height / 2,
                                  onPressed: () {}),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: height - 15,
                              width: height - 10,
                              decoration: BoxDecoration(
                                  color:
                                      AppColors.white.color.withOpacity(0.1)),
                              child: IconButtonWidget(
                                  iconData: Icons.fast_forward,
                                  color: AppColors.white.color,
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      );
                    }),
                IconButtonWidget(
                    iconData: Icons.shuffle,
                    color: AppColors.accent.color,
                    onPressed: () {}),
              ],
            ),
          );
        });
  }
}
