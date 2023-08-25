// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class Imagine extends StatelessWidget {
  Imagine({super.key});

  final images = [
    'assets/images/Iceland1.JPG',
    'assets/images/Iceland2.JPG',
    'assets/images/Iceland3.JPG',
    'assets/images/Iceland4.JPG',
    'assets/images/Iceland5.JPG',
    'assets/images/Iceland6.JPG',
    'assets/images/Iceland7.JPG',
    'assets/images/Iceland8.JPG'
  ];

  final String appTitle =
      const String.fromEnvironment('TITLE', defaultValue: 'My App');
  final String appColor =
      const String.fromEnvironment('COLOR', defaultValue: '#000000');
  final String titleColor =
      const String.fromEnvironment('TITLEColor', defaultValue: '#f0f0f0');

  Color getColorFromString(String colorString) {
    return Color(int.parse(colorString.replaceAll('#', '0xFF')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColorFromString(appColor),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            print("go back");
          },
        ),
        title: Text(
          appTitle,
          style: TextStyle(
              color: getColorFromString(titleColor),
              fontFamily: AppFonts.cormorant.font,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const _Title(),
            const SizedBox(width: 20),
            const _AdditionalInformation(),
            ImageScroll(images: images),
            const Align(
              alignment: Alignment.center,
              child: BookATourButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class BookATourButton extends StatelessWidget {
  const BookATourButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          print("BookATour button tapped");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.darkGreen.color,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Set the desired border radius here
          ),
        ),
        child: Text(
          'BOOK A TOUR',
          style: TextStyle(
              fontFamily: AppFonts.cormorant.font, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ImageScroll extends StatelessWidget {
  const ImageScroll({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      child: InfiniteCarousel.builder(
        itemCount: images.length,
        itemExtent: 140,
        center: true,
        anchor: 0.23,
        velocityFactor: 0.2,
        onIndexChanged: (index) {},
        controller: InfiniteScrollController(),
        axisDirection: Axis.horizontal,
        loop: true,
        itemBuilder: (context, itemIndex, realIndex) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(images[itemIndex]),
          );
        },
      ),
    );
  }
}

class _AdditionalInformation extends StatelessWidget {
  const _AdditionalInformation();

  TextStyle textStile() {
    return TextStyle(
        color: AppColor.lightGrey.color,
        fontSize: 12,
        fontFamily: AppFonts.asteria.font,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w200);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.darkGrey.color,
      width: double.infinity,
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/map.PNG', width: 200, height: 200),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FIREICE",
                style: TextStyle(
                    color: AppColor.white.color,
                    fontSize: 20,
                    fontFamily: AppFonts.cormorant.font,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("5 day Icelandic adventure", style: textStile()),
              Text("Obsidian formations", style: textStile()),
              Text("Lava fields, lava lakes", style: textStile()),
              Text("3 treks across the wilderness", style: textStile()),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    print("LearnMore button tapped");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.grey.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Set the desired border radius here
                    ),
                  ),
                  child: Text(
                    'Learn more',
                    style: TextStyle(fontFamily: AppFonts.asteria.font),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Text(
            "ICELAND",
            style: TextStyle(
                color: AppColor.orange.color,
                fontSize: 50,
                fontFamily: AppFonts.cormorant.font,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 0, 16, 0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              "Iceland is the land of volcanoes, geysers, whales, waterfalls and incredible journeys. ",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.asteria.font,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ),
      ],
    );
  }
}

enum AppColor { grey, white, darkGreen, orange, darkGrey, lightGrey }

extension AppColorExtension on AppColor {
  Color get color {
    switch (this) {
      case AppColor.grey:
        return const Color.fromARGB(255, 67, 68, 67);
      case AppColor.white:
        return const Color.fromARGB(255, 240, 240, 240);
      case AppColor.darkGreen:
        return const Color.fromARGB(255, 6, 32, 7);
      case AppColor.orange:
        return const Color.fromARGB(255, 116, 53, 2);
      case AppColor.darkGrey:
        return const Color.fromARGB(255, 29, 30, 34);
      case AppColor.lightGrey:
        return const Color.fromARGB(255, 94, 94, 95);
      default:
        return Colors.black;
    }
  }
}

enum AppFonts { asteria, cormorant }

extension AppFontsExtension on AppFonts {
  String get font {
    switch (this) {
      case AppFonts.cormorant:
        return "CormorantInfant";
      default:
        return "Asteria";
    }
  }
}
