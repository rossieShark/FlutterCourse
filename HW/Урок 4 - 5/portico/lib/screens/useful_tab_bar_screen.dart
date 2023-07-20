// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:portico/main.dart';
import 'package:portico/models/useful_model.dart';
import 'package:portico/widgets/button_widget.dart';
import 'package:portico/widgets/sized_box_widget.dart';
import 'package:portico/widgets/text_field_widget.dart';

class UsefulTabBarScreen extends StatelessWidget {
  UsefulTabBarScreen({super.key});

  final List<CategoryModel> usefulInformationList = List.generate(
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
    final bool isIpad = MediaQuery.of(context).size.width > 600;
    final fontSize = isIpad
        ? MediaQuery.of(context).size.width * 0.02
        : MediaQuery.of(context).size.width * 0.03;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double availableHeight = constraints.maxHeight;

        double dynamicListHeight = usefulInformationList.length *
            MediaQuery.of(context).size.height *
            (isIpad ? 0.2 : 0.15);

        double scrollableHeight = availableHeight + dynamicListHeight;

        return CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/Black.jpg",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: scrollableHeight,
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
                        height: scrollableHeight / 2,
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
                                IconButtonWidget(
                                    iconData: Icons.ios_share,
                                    color: AppColorData.white,
                                    onPressed: () {
                                      print('Share button tapped');
                                    })
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CustomSizedBox(iPadheight: 40),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        25, 30, 16, 16),
                                    child: Text(
                                      'Are you ready for the journey?',
                                      style: TextStyle(
                                        fontSize: isIpad
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                        fontWeight: FontWeight.w600,
                                        color: AppColorData.white,
                                        fontFamily: AppFonts.asteria.font,
                                      ),
                                    ),
                                  ),
                                ),
                                const CustomSizedBox(
                                    iPadheight: 40, phoneHeight: 10),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: CustomTextField(
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    placeholder: 'Search',
                                    icon: const Icon(
                                      Icons.search,
                                      color: AppColorData.lightGrey,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 12.0,
                                    ),
                                    boxDecoration: BoxDecoration(
                                      color: AppColorData.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const CustomSizedBox(iPadheight: 20),
                                CategoryScrollList(
                                    category: category, fontSize: fontSize),
                              ],
                            ),
                            const CustomSizedBox(
                                iPadheight: 60, phoneHeight: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                child: Text(
                                  'For you',
                                  style: TextStyle(
                                    color: AppColorData.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
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
                              PhoneUsefulInformationListView(
                                  categoryList: usefulInformationList)
                            else
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: IpadUsefulInformationListView(
                                      categoryList: usefulInformationList),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]);
      }),
    );
  }
}

class IpadUsefulInformationListView extends StatelessWidget {
  const IpadUsefulInformationListView({
    super.key,
    required this.categoryList,
  });

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoryList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
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
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categoryItem.nameLabel,
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: AppFonts.cormorant.font,
                                fontWeight: FontWeight.w900,
                                color: AppColorData.darkRed,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              categoryItem.description,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: AppFonts.cormorant.font,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                      child: TextButtonWidget(
                        onPressed: () {
                          print('CategoryButton tapped');
                        },
                        text: Text(
                          'Learn more',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColorData.blue,
                              fontFamily: AppFonts.cormorant.font,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColorData.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 16,
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
    );
  }
}

class PhoneUsefulInformationListView extends StatelessWidget {
  const PhoneUsefulInformationListView({
    super.key,
    required this.categoryList,
  });

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        categoryList.length,
        (index) {
          final categoryItem = categoryList[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: AppColorData.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            categoryItem.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              categoryItem.nameLabel,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: AppFonts.cormorant.font,
                                fontWeight: FontWeight.bold,
                                color: AppColorData.darkRed,
                              ),
                            ),
                            Text(
                              categoryItem.description,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.cormorant.font,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButtonWidget(
                                onPressed: () {
                                  print('CategoryButton tapped');
                                },
                                text: Text(
                                  'Learn more',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColorData.blue,
                                      fontFamily: AppFonts.cormorant.font,
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 12),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColorData.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 16,
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
    );
  }
}

class CategoryScrollList extends StatelessWidget {
  const CategoryScrollList({
    super.key,
    required this.category,
    required this.fontSize,
  });

  final List<String> category;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: Row(
          children: List.generate(category.length, (index) {
            final categoryName = category[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      print('CategoryButton tapped');
                    },
                    child: ClipOval(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.11,
                        height: MediaQuery.of(context).size.width * 0.11,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            categoryName.substring(0, 1),
                            style: TextStyle(
                              color: AppColorData.white,
                              fontSize: fontSize,
                              fontFamily: AppFonts.rosiebrown.font,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    categoryName,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: AppColorData.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.cormorant.font,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
