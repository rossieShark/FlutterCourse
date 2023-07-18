// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:portico/Controllers/filter_controller.dart';
import 'package:portico/Helper/colors_fonts.dart';
import 'package:portico/Model/profile_grid_model.dart';

class ProfileTabBarController extends StatelessWidget {
  ProfileTabBarController({Key? key}) : super(key: key);

  final List<ProfileGridModel> profileGrid = [
    ProfileGridModel(imageLabel: 'Flowers', images: flowersList),
    ProfileGridModel(imageLabel: 'Cold', images: coldList),
    ProfileGridModel(imageLabel: 'Girls', images: girlsList),
    ProfileGridModel(imageLabel: 'Liquid', images: liquidList),
    ProfileGridModel(imageLabel: 'Naturalness', images: naturalnessList),
    ProfileGridModel(imageLabel: 'Nature', images: natureList)
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIpad = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Black.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  theme.primaryColor,
                  Colors.white.withOpacity(0)
                ],
                tileMode: TileMode.decal,
              ).createShader(bounds);
            },
            child: Image.asset(
              'assets/images/art2.JPG',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (Platform.isIOS)
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            print('SettingsButton pressed');
                          },
                          child: const Icon(
                            CupertinoIcons.share,
                            color: AppColorData.white,
                          ),
                        )
                      else
                        IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: AppColorData.white,
                          ),
                          onPressed: () {
                            print('SettingsButton pressed');
                          },
                        ),
                      Row(
                        children: [
                          if (Platform.isIOS)
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                print('ShareButton pressed');
                              },
                              child: const Icon(
                                CupertinoIcons.settings,
                                color: AppColorData.white,
                              ),
                            )
                          else
                            IconButton(
                              icon: const Icon(Icons.settings,
                                  color: AppColorData.white),
                              onPressed: () {
                                print('ShareButton pressed');
                              },
                            ),
                          if (Platform.isIOS)
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                print('SettingsButton pressed');
                              },
                              child: const Icon(
                                Icons.logout,
                                color: AppColorData.white,
                              ),
                            )
                          else
                            IconButton(
                              icon: const Icon(Icons.logout,
                                  color: AppColorData.white),
                              onPressed: () {
                                print('SettingsButton pressed');
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final double imageSize = isIpad
                          ? constraints.maxWidth * 0.15
                          : constraints.maxWidth * 0.2;
                      final double iconSize = isIpad
                          ? constraints.maxWidth * 0.03
                          : constraints.maxWidth * 0.04;
                      final double textFontSize = isIpad
                          ? constraints.maxWidth * 0.03
                          : constraints.maxWidth * 0.04;

                      return Column(
                        children: [
                          isIpad
                              ? const SizedBox(height: 40)
                              : const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: imageSize,
                              height: imageSize,
                              child: ClipOval(
                                child: CircleAvatar(
                                  backgroundImage: const AssetImage(
                                    'assets/images/user.png',
                                  ),
                                  radius: imageSize * 0.5,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'User name',
                            style: TextStyle(
                              color: AppColorData.white,
                              fontSize: textFontSize,
                              fontFamily: AppFonts.cormorant.font,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'User nickname',
                            style: TextStyle(
                              color: AppColorData.lightGrey,
                              fontSize: textFontSize,
                              fontFamily: AppFonts.cormorant.font,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          isIpad
                              ? const SizedBox(height: 20)
                              : const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: iconSize,
                                    width: iconSize,
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      child: Image.asset(
                                        'assets/images/subscribtion.png',
                                        color: AppColorData.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '120k',
                                    style: TextStyle(
                                      color: AppColorData.white,
                                      fontSize: textFontSize,
                                      fontFamily: AppFonts.cormorant.font,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: iconSize,
                                    width: iconSize,
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        print('icon Button pressed');
                                      },
                                      child: Image.asset(
                                        'assets/images/subscribtion.png',
                                        color: AppColorData.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '120k',
                                    style: TextStyle(
                                      color: AppColorData.white,
                                      fontSize: textFontSize,
                                      fontFamily: AppFonts.cormorant.font,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      children: profileGrid.map((item) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilterController(
                                  label: item.imageLabel,
                                  images: item.images,
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              final double imageWidth = constraints.maxWidth;
                              final double imageHeight = imageWidth * 3 / 4;

                              return Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColorData.lightGrey
                                          .withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: imageWidth,
                                      height: imageHeight,
                                      child: Image.asset(
                                        item.images.first,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: imageWidth,
                                      height: imageHeight * 1 / 5,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.center,
                                        child: AutoSizeText(
                                          item.imageLabel,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AppFonts.cormorant.font,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Platform.isIOS
                          ? CupertinoButton(
                              onPressed: () {
                                print("Add button tapped");
                              },
                              color: Colors.black,
                              padding: const EdgeInsets.all(16.0),
                              child: const Text(
                                '+',
                                style: TextStyle(
                                    color: AppColorData.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                print("Add button tapped");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.focusColor,
                              ),
                              child: const Text(
                                '+',
                                style: TextStyle(
                                    color: AppColorData.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
