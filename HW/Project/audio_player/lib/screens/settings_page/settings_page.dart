import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/screens/settings_page/settings_index.dart';
import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _signOut() async {
    try {
      await _auth.signOut();

      print('User signed out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<void> _deleteAccount() async {
    await user?.delete();
  }

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 200,
        padding: const EdgeInsets.only(top: 0.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingPageTitle,
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: AppColors.background.color,
      ),
      body: SettingsList(
        lightTheme: SettingsThemeData(
          settingsListBackground: AppColors.background.color,
          trailingTextColor: Colors.grey,
          settingsSectionBackground: AppColors.background.color,
          dividerColor: AppColors.background.color,
          titleTextColor: Colors.grey,
          inactiveTitleColor: AppColors.white.color,
        ),
        sections: [
          SettingsSection(
            title: Text(AppLocalizations.of(context)!.settingPageCommon),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                onPressed: (context) => _showDialog(
                    CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: 32.0,
                      scrollController: FixedExtentScrollController(
                        initialItem: 0,
                      ),
                      onSelectedItemChanged: (int selectedItem) {
                        setState(() {
                          final newLocale = Locale.fromSubtags(
                              languageCode: pickerData[selectedItem]);
                          final languageProvider =
                              Provider.of<LanguageProvider>(context,
                                  listen: false);
                          languageProvider.changeLocale(newLocale);
                        });
                      },
                      children:
                          List<Widget>.generate(pickerData.length, (int index) {
                        return Center(child: Text(pickerData[index]));
                      }),
                    ),
                    context),
                leading: const Icon(Icons.language),
                title: Text(
                    AppLocalizations.of(context)!.settingPageCommonLanguage,
                    style: TextStyle(color: AppColors.white.color)),
                value: Text(Localizations.localeOf(context).languageCode),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.subscriptions),
                title: Text(
                    AppLocalizations.of(context)!
                        .settingPageCommonSubscriptionPlan,
                    style: TextStyle(color: AppColors.white.color)),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.devices),
                title: Text(
                    AppLocalizations.of(context)!.settingPageCommonDevices,
                    style: TextStyle(color: AppColors.white.color)),
              ),
            ],
          ),
          SettingsSection(
              title: Text(AppLocalizations.of(context)!.settingPageAccount),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.account_box),
                  title: Text(AppLocalizations.of(context)!.settingPageAccount,
                      style: TextStyle(color: AppColors.white.color)),
                  onPressed: (BuildContext context) {
                    modal.showBarModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => PlatformBuilder(
                          iOS: const ChangeUserinfo(),
                          other: const ChangeUserinfo(),
                          builder: (context, child, widget) {
                            return widget;
                          }),
                    );
                  },
                ),
                SettingsTile.navigation(
                  onPressed: (BuildContext context) {
                    modal.showBarModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ChangePassword(),
                    );
                  },
                  leading: const Icon(Icons.key),
                  title: Text(
                      AppLocalizations.of(context)!.settingPageAccountPassword,
                      style: TextStyle(color: AppColors.white.color)),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.payment),
                  title: Text(
                      AppLocalizations.of(context)!.settingPageAccountPayment,
                      style: TextStyle(color: AppColors.white.color)),
                ),
                SettingsTile.navigation(
                  onPressed: (context) => showDialog(
                    context: context,
                    builder: (context) => AppAlertDialog(
                      onConfirm: () async {
                        await _deleteAccount();
                        await _signOut();
                        Navigator.of(context).pop();
                      },
                      title: AppLocalizations.of(context)!.deleteAccount,
                      subtitle:
                          AppLocalizations.of(context)!.deleteAccountAlert,
                    ),
                  ),
                  leading: const Icon(Icons.delete_forever),
                  title: Text(
                      AppLocalizations.of(context)!.settingPageAccountDelete,
                      style: TextStyle(color: AppColors.white.color)),
                ),
              ]),
          SettingsSection(title: const Text(''), tiles: <SettingsTile>[
            SettingsTile(
              onPressed: (context) {
                _signOut();
                context.go(routeNameMap[RouteName.sigIn]!);
              },
              title: Center(
                child: Text(
                  AppLocalizations.of(context)!.settingPageLogOut,
                  style: TextStyle(color: AppColors.accent.color),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

List<String> pickerData = [
  'en',
  'de',
  'ru',
];
