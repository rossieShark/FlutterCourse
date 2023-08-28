import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/tab_bar/ipad_tab.dart';
import 'package:audio_player/screens/tab_bar/mobile_tab.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtomTabBarPage extends StatelessWidget {
  final Widget child;
  const ButtomTabBarPage({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarBloc, int>(builder: (context, tabIndex) {
      return WillPopScope(
          onWillPop: () async {
            final result = await showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                      title: const Text("Are you sure you want to exit?"),
                      actions: [
                        CupertinoActionSheetAction(
                            onPressed: () {
                              context.pop(true);
                            },
                            child: const Text('Yes')),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            context.pop(false);
                          },
                          child: const Text('No'),
                        ),
                      ]);
                });
            return result == true;
          },
          child: ResponsiveWidget(
              narrow: (context) =>
                  MobileVersion(tabIndex: tabIndex, child: child),
              medium: (context) =>
                  IPadVersion(tabIndex: tabIndex, child: child),
              large: (context) =>
                  IPadVersion(tabIndex: tabIndex, child: child)));
    });
  }
}
