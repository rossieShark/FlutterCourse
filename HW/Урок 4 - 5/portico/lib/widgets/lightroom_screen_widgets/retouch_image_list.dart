import 'package:flutter/material.dart';
import 'package:portico/main.dart';

import '../../screens/lightroom_screen.dart';
import '../general_widgets/assest.dart';

class RetouchImageList extends StatelessWidget {
  const RetouchImageList(
      {Key? key, required this.selectedIndex, required this.changeFilter})
      : super(key: key);

  final int? selectedIndex;
  final void Function(int) changeFilter;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: FilterName.values.length,
        itemBuilder: (context, index) {
          final double imageHeight = mediaQuery.size.height / 5;
          final filterName = FilterName.values[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: GestureDetector(
              onTap: () {
                changeFilter(index);
              },
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: colorFilters[filterName.index]!,
                    child: SizedBox(
                      height: imageHeight,
                      child: Image.asset(
                        Assets.retouch.asset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      width: double.infinity,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        color: selectedIndex == filterName.index
                            ? Colors.black.withOpacity(0.5)
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          filterNameMap[filterName]!,
                          style: TextStyle(
                              color: selectedIndex == filterName.index
                                  ? AppColorData.white
                                  : Colors.transparent,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.cormorant.font),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
