import 'package:flutter/material.dart';

import '../widgets/ui_widget.dart';

class FullRecipe extends StatelessWidget {
  final List<String>? recipe;

  const FullRecipe({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black.color,
      appBar: AppBar(
        title: Text(
          'Full Recipe',
          style: TextStyle(
            fontFamily: AppFonts.fontspring.font,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: recipe?.length ?? 1,
          itemBuilder: (context, index) {
            return recipe?.length == null
                ? SizedBox(
                    height: maxHeight / 2,
                    width: maxWidth / 2,
                    child: Center(
                        child: Text(
                      'No recipe',
                      style: TextStyle(
                          color: AppColors.white.color,
                          fontSize: maxHeight * 0.02,
                          fontFamily: AppFonts.montserrat.font),
                    )),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: maxHeight * 0.13,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.white.color, width: 1))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 45,
                                color: AppColors.white.color,
                                fontFamily: 'gogol',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                              child: SizedBox(
                                height: maxHeight * 0.13,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    recipe![index],
                                    maxLines: 6,
                                    style: TextStyle(
                                      fontFamily: AppFonts.montserrat.font,
                                      color: AppColors.white.color,
                                      fontSize: maxHeight * 0.014,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
