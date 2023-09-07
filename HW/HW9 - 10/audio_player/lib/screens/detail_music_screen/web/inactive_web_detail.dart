import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class InactiveWebDetailPage extends StatelessWidget {
  const InactiveWebDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IconButtonWidget(
                        iconData: Icons.repeat,
                        size: 20,
                        color: Colors.grey,
                        onPressed: null),
                    Row(
                      children: [
                        const IconButtonWidget(
                            iconData: Icons.fast_rewind,
                            size: 20,
                            color: Colors.grey,
                            onPressed: null),
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: AppColors.white.color.withOpacity(0.1)),
                            child: const IconButtonWidget(
                                iconData: Icons.play_arrow,
                                color: Colors.grey,
                                size: 40 / 2,
                                onPressed: null),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const IconButtonWidget(
                            iconData: Icons.fast_forward,
                            size: 20,
                            color: Colors.grey,
                            onPressed: null),
                      ],
                    ),
                    const IconButtonWidget(
                        iconData: Icons.shuffle,
                        size: 20,
                        color: Colors.grey,
                        onPressed: null),
                  ],
                ),
                Row(
                  children: [
                    Text('-:--',
                        style: TextStyle(
                            fontFamily: AppFonts.colombia.font,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Slider(
                        inactiveColor: Colors.grey,
                        value: 0.5,
                        min: 0.0,
                        max: 1.0,
                        onChanged: null,
                      ),
                    ),
                    Text('-:--',
                        style: TextStyle(
                            fontFamily: AppFonts.colombia.font,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey)),
                  ],
                ),
              ]),
            ]));
  }
}
