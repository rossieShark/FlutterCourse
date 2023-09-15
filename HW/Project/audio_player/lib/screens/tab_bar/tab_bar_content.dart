import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabBarContent extends StatelessWidget {
  final Widget child;
  const TabBarContent({
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
                    title:
                        Text(AppLocalizations.of(context)!.exitConfirmMessage),
                    actions: [
                      CupertinoActionSheetAction(
                          onPressed: () {
                            context.pop(true);
                          },
                          child: Text(AppLocalizations.of(context)!.yesButton)),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          context.pop(false);
                        },
                        child: Text(AppLocalizations.of(context)!.noButton),
                      ),
                    ]);
              });
          return result == true;
        },
        child: PlatformBuilder(
            web: WebTabBar(tabIndex: tabIndex, child: child),
            other: ResponsiveWidget(
              narrow: (context) =>
                  MobileTabBar(tabIndex: tabIndex, child: child),
              other: (context) => IPadTabBar(tabIndex: tabIndex, child: child),
            ),
            builder: (context, child, widget) {
              return widget;
            }),
      );
    });
  }
}
