// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portico/main.dart';

import 'package:portico/screens/photos_screen.dart';

import 'package:portico/models/profile_grid_model.dart';
import 'package:portico/widgets/general_widgets/button_widget.dart';
import 'package:portico/widgets/general_widgets/sized_box_widget.dart';

import '../widgets/general_widgets/assest.dart';

class ProfileTabBarScreen extends StatelessWidget {
  ProfileTabBarScreen({Key? key}) : super(key: key);

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
            Assets.blackSquare.asset,
            fit: BoxFit.fill,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
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
              Assets.art2.asset,
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
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
                  const AppBarButtons(),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final double imageSize = isIpad
                          ? constraints.maxWidth * 0.15
                          : constraints.maxWidth * 0.2;
                      final double iconSize = isIpad
                          ? constraints.maxWidth * 0.03
                          : constraints.maxWidth * 0.04;

                      return Column(
                        children: [
                          const CustomSizedBox(iPadheight: 40, phoneHeight: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: imageSize,
                              height: imageSize,
                              child: ClipOval(
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    Assets.user.asset,
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
                              fontSize: iconSize,
                              fontFamily: AppFonts.cormorant.font,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'User nickname',
                            style: TextStyle(
                              color: AppColorData.lightGrey,
                              fontSize: iconSize,
                              fontFamily: AppFonts.cormorant.font,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const CustomSizedBox(iPadheight: 20, phoneHeight: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FollowersButton(
                                  iconSize: iconSize, textFontSize: iconSize),
                              FollowersButton(
                                  iconSize: iconSize, textFontSize: iconSize),
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
                    child: LayoutBuilder(builder: (context, constraints) {
                      final screenWidth = constraints.maxWidth;
                      final crossAxisCount =
                          isIpad ? screenWidth ~/ 250 : screenWidth ~/ 150;

                      return PhotosGridView(
                          crossAxisCount: crossAxisCount,
                          profileGrid: profileGrid,
                          theme: theme);
                    }),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: TextButtonWidget(
                          onPressed: () {
                            print("Add button tapped");
                          },
                          color: Colors.black,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Text(
                            '+',
                            style: TextStyle(
                                color: AppColorData.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
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

class PhotosGridView extends StatelessWidget {
  const PhotosGridView({
    Key? key, // Add the Key parameter here
    required this.crossAxisCount,
    required this.profileGrid,
    required this.theme,
  }) : super(key: key); // Use the 'key' keyword instead of 'super.key'

  final int crossAxisCount;
  final List<ProfileGridModel> profileGrid;
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: crossAxisCount,
      scrollDirection: Axis.vertical,
      children: profileGrid.map((item) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotosScreen(
                  label: item.imageLabel,
                  images: item.images,
                ),
                fullscreenDialog: true,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColorData.lightGrey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 4,
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    final double imageWidth = constraints.maxWidth;

                    return SizedBox(
                      child: Image.asset(
                        item.images.first,
                        width: imageWidth,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        item.imageLabel,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppFonts.cormorant.font,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButtonWidget(
          iconData: CupertinoIcons.share,
          color: AppColorData.white,
          onPressed: () {
            print('ShareButton pressed');
          },
        ),
        Row(
          children: [
            IconButtonWidget(
                iconData: CupertinoIcons.settings,
                color: AppColorData.white,
                onPressed: () {
                  print('ShareButton pressed');
                }),
            IconButtonWidget(
                iconData: Icons.logout,
                color: AppColorData.white,
                onPressed: () {
                  print('LogoutButton pressed');
                }),
          ],
        ),
      ],
    );
  }
}

class FollowersButton extends StatelessWidget {
  const FollowersButton({
    super.key,
    required this.iconSize,
    required this.textFontSize,
  });

  final double iconSize;
  final double textFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Assets.subscribtion.asset,
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
    );
  }
}
