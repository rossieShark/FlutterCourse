import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: IconButtonWidget(
                iconData: Icons.arrow_back,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop(true);
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3 * 2,
            color: Colors.black,
            child: const Center(
              child: Text(
                'No data',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
