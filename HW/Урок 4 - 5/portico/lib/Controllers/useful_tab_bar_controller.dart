// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:portico/Helper/colors_fonts.dart';
import 'package:portico/Model/useful_model.dart';

class UsefulTabBarController extends StatelessWidget {
  UsefulTabBarController({super.key});

  final List<CategoryModel> categoryList = List.generate(
    9,
    (index) => CategoryModel(
      nameLabel: 'Paolo Roversi',
      description:
          'Learn how the great Paolo Roversi shot his masterpieces, his popular lighting schemes and backstages from the shoot.',
      image: "assets/images/Roversi.JPG",
    ),
  );

  final List<String> category = [
    'Photography',
    'Cinema',
    'Painting',
    'Videography',
    'Artist',
    'Exhibition',
    'Photograph',
    'Director',
  ];

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));
    }

    final maxHeight = MediaQuery.of(context).size.height +
        categoryList.length * (MediaQuery.of(context).size.width * 0.3);
    final bool isIpad = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: maxHeight,
          child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/Black.jpg",
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: maxHeight,
                ),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        const Color.fromARGB(255, 255, 255, 255),
                        Colors.white.withOpacity(0),
                      ],
                      tileMode: TileMode.decal,
                    ).createShader(bounds);
                  },
                  child: Image.asset(
                    'assets/images/art1.JPG',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: isIpad ? maxHeight / 5 : maxHeight / 3,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            if (Platform.isIOS)
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  print('Share button tapped');
                                },
                                child: const Icon(
                                  CupertinoIcons.share,
                                  color: AppColorData.white,
                                ),
                              )
                            else
                              IconButton(
                                onPressed: () {
                                  print('Share button tapped');
                                },
                                icon: const Icon(Icons.share),
                                color: AppColorData.white,
                              ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            isIpad
                                ? const SizedBox(height: 40)
                                : const SizedBox(height: 0),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 30, 16, 16),
                                child: Text(
                                  'Are you ready for the journey?',
                                  style: TextStyle(
                                    fontSize: isIpad
                                        ? MediaQuery.of(context).size.width *
                                            0.06
                                        : MediaQuery.of(context).size.width *
                                            0.08,
                                    fontWeight: FontWeight.w600,
                                    color: AppColorData.white,
                                    fontFamily: AppFonts.asteria.font,
                                  ),
                                ),
                              ),
                            ),
                            isIpad
                                ? const SizedBox(height: 40)
                                : const SizedBox(height: 10),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Platform.isIOS
                                  ? CupertinoTextField(
                                      prefix: const Icon(
                                        CupertinoIcons.search,
                                        color: AppColorData.lightGrey,
                                      ),
                                      placeholder: 'Search',
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 12.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    )
                                  : const TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search),
                                        hintText: 'Search',
                                        border: InputBorder.none,
                                      ),
                                    ),
                            ),
                            isIpad
                                ? const SizedBox(height: 20)
                                : const SizedBox(height: 0),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 0, 0),
                                child: Row(
                                  children:
                                      List.generate(category.length, (index) {
                                    final categoryName = category[index];
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 16, 6),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CupertinoButton(
                                            onPressed: () {
                                              print('CategoryButton tapped');
                                            },
                                            child: ClipOval(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.11,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.11,
                                                color: Colors.black,
                                                child: Center(
                                                  child: Text(
                                                    categoryName.substring(
                                                        0, 1),
                                                    style: TextStyle(
                                                      color: AppColorData.white,
                                                      fontSize: isIpad
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.015
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                      fontFamily: AppFonts
                                                          .rosiebrown.font,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            categoryName,
                                            style: TextStyle(
                                              fontSize: isIpad
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                              color: AppColorData.white,
                                              fontWeight: FontWeight.w600,
                                              fontFamily:
                                                  AppFonts.cormorant.font,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        isIpad
                            ? const SizedBox(height: 60)
                            : const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Text(
                              'For you',
                              style: TextStyle(
                                color: AppColorData.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                fontFamily: AppFonts.asteria.font,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: AppColorData.lightGrey,
                          height: 1,
                          thickness: 1.5,
                          indent: 0,
                          endIndent: 0,
                        ),
                        const SizedBox(height: 10),
                        if (!isIpad)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(
                              categoryList.length,
                              (index) {
                                final categoryItem = categoryList[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: AppColorData.white,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: SizedBox(
                                              height: 130,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  categoryItem.image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 8, 8, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    categoryItem.nameLabel,
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontFamily: AppFonts
                                                          .cormorant.font,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColorData.darkRed,
                                                    ),
                                                  ),
                                                  Text(
                                                    categoryItem.description,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: AppFonts
                                                          .cormorant.font,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Platform.isIOS
                                                        ? CupertinoButton(
                                                            onPressed: () {
                                                              print(
                                                                  'CategoryButton tapped');
                                                            },
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 0,
                                                              horizontal: 12,
                                                            ),
                                                            child: const Text(
                                                              'Learn more',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    AppColorData
                                                                        .blue,
                                                              ),
                                                            ),
                                                          )
                                                        : ElevatedButton(
                                                            onPressed: () {
                                                              print(
                                                                  'CategoryButton tapped');
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  AppColorData
                                                                      .blue,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical: 2,
                                                                horizontal: 12,
                                                              ),
                                                            ),
                                                            child: const Text(
                                                              'Learn more',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 10,
                                                                color:
                                                                    AppColorData
                                                                        .white,
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
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: categoryList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.75, // Adjust this value to change child size
                                ),
                                itemBuilder: (context, index) {
                                  final categoryItem = categoryList[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        color: AppColorData.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Image.asset(
                                                  categoryItem.image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 8, 8, 0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16, 0, 16, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        categoryItem.nameLabel,
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontFamily: AppFonts
                                                              .cormorant.font,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: AppColorData
                                                              .darkRed,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        categoryItem
                                                            .description,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: AppFonts
                                                              .cormorant.font,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 4,
                                              ),
                                              child: Platform.isIOS
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          16, 0, 16, 0),
                                                      child: CupertinoButton(
                                                        onPressed: () {
                                                          print(
                                                              'CategoryButton tapped');
                                                        },
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 0,
                                                          horizontal: 16,
                                                        ),
                                                        child: const Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: Text(
                                                            'Learn more',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  AppColorData
                                                                      .blue,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          50, 0, 50, 10),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          print(
                                                              'CategoryButton tapped');
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppColorData.blue,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 0,
                                                            horizontal: 16,
                                                          ),
                                                        ),
                                                        child: const Text(
                                                          'Learn more',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                            color: AppColorData
                                                                .white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
