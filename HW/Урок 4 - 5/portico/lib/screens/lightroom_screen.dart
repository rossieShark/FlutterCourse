// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:portico/main.dart';
import 'package:portico/widgets/general_widgets/button_widget.dart';
import 'package:portico/widgets/general_widgets/sized_box_widget.dart';

import '../widgets/lightroom_screen_widgets/color_picker_button.dart';
import '../widgets/lightroom_screen_widgets/main_image_stack.dart';
import '../widgets/lightroom_screen_widgets/retouch_image_list.dart';

class LightroomScreen extends StatefulWidget {
  final String image;
  const LightroomScreen({Key? key, required this.image}) : super(key: key);

  @override
  LightroomScreenState createState() => LightroomScreenState();
}

class LightroomScreenState extends State<LightroomScreen> {
  var changedText = '';
  final TextEditingController _textEditingController = TextEditingController();

  int? selectedIndex;
  Color textColor = AppColorData.white;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _changeTextColor(Color color) {
    setState(() {
      textColor = color;
    });
  }

  void _changeFilter(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColorData.white,
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButtonWidget(
              iconData: CupertinoIcons.share,
              color: Colors.black,
              onPressed: () {
                print('share button pressed');
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomSizedBox(iPadheight: 50, phoneHeight: 20),
              MainImageStack(
                  selectedIndex: selectedIndex,
                  widget: widget,
                  changedText: changedText,
                  textColor: textColor),
              const CustomSizedBox(iPadheight: 50, phoneHeight: 20),
              Column(
                children: [
                  SizedBox(
                    height: mediaQuery.size.height / 4.8,
                    child: RetouchImageList(
                      changeFilter: _changeFilter,
                      selectedIndex: selectedIndex,
                    ),
                  ),
                  const CustomSizedBox(iPadheight: 50, phoneHeight: 20),
                  Row(children: [
                    Expanded(
                      child: Container(
                        height: mediaQuery.size.height / 25,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColorData.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _textEditingController,
                          style: TextStyle(
                            color: textColor,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Enter the text',
                            labelStyle: TextStyle(
                                color: AppColorData.lightGrey,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColorData.darkGrey)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColorData.darkRed,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              changedText = value;
                            });
                            print('Entered text: $value');
                          },
                        ),
                      ),
                    ),
                    ColorPickerButton(
                      changeTextColor: _changeTextColor,
                      textColor: textColor,
                    ),
                  ]),
                  const SizedBox(height: 20),
                ],
              ),
            ]),
      ),
    );
  }
}

const List<ColorFilter?> colorFilters = [
  ColorFilter.mode(Colors.transparent, BlendMode.difference),
  ColorFilter.mode(Colors.grey, BlendMode.saturation),
  ColorFilter.mode(Color.fromARGB(255, 87, 6, 6), BlendMode.color),
  ColorFilter.mode(Colors.white, BlendMode.softLight),
  ColorFilter.mode(Color.fromARGB(255, 23, 66, 4), BlendMode.screen),
  ColorFilter.mode(Color.fromARGB(255, 117, 9, 54), BlendMode.softLight),
  ColorFilter.mode(Color.fromARGB(255, 39, 8, 130), BlendMode.screen),
  ColorFilter.mode(Color.fromARGB(255, 200, 128, 40), BlendMode.dst),
  ColorFilter.mode(Color.fromARGB(255, 20, 86, 10), BlendMode.softLight),
  ColorFilter.mode(Color.fromARGB(255, 234, 239, 123), BlendMode.softLight),
  ColorFilter.mode(Color.fromARGB(255, 5, 33, 171), BlendMode.difference),
  ColorFilter.mode(Color.fromARGB(255, 50, 50, 50), BlendMode.colorDodge),
  ColorFilter.mode(Color.fromARGB(255, 107, 62, 6), BlendMode.color),
  ColorFilter.mode(Color.fromARGB(255, 210, 9, 9), BlendMode.exclusion),
];

enum FilterName {
  none,
  bw,
  red,
  soft,
  vnYl3,
  n1991,
  n1993,
  dodger,
  sun1,
  sun2,
  cross,
  dark,
  film,
  excl,
}

const Map<FilterName, String> filterNameMap = {
  FilterName.none: 'None',
  FilterName.bw: 'B&W',
  FilterName.red: 'Red',
  FilterName.soft: 'Soft',
  FilterName.vnYl3: 'VNYL3',
  FilterName.n1991: '1991',
  FilterName.n1993: '1993',
  FilterName.dodger: 'Dodger',
  FilterName.sun1: 'Sun1',
  FilterName.sun2: 'Sun2',
  FilterName.cross: 'Cross',
  FilterName.dark: 'Dark',
  FilterName.film: 'Film',
  FilterName.excl: 'EXCL',
};
