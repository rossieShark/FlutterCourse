import 'package:project/screens/settings_page/change_profile/change_profile.dart';
import 'package:project/screens/tab_bar/index.dart';
import 'package:project/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

class Settings extends StatelessWidget {
  Settings({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _signOut() async {
    try {
      await _auth.signOut();

      print('User signed out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        title: Text('Settings', style: Theme.of(context).textTheme.titleMedium),
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
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: Text('Language',
                    style: TextStyle(color: AppColors.white.color)),
                value: const Text('English'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.subscriptions),
                title: Text('Subscription plan',
                    style: TextStyle(color: AppColors.white.color)),
              ),
              SettingsTile.switchTile(
                activeSwitchColor: AppColors.accent.color,
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: Text(
                  'Enable custom theme',
                  style: TextStyle(color: AppColors.white.color),
                ),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.devices),
                title: Text('Devices',
                    style: TextStyle(color: AppColors.white.color)),
              ),
            ],
          ),
          SettingsSection(title: const Text('Account'), tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.account_box),
              title: Text('Account',
                  style: TextStyle(color: AppColors.white.color)),
              onPressed: (BuildContext context) {
                modal.showBarModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ChangeUserinfo(),
                );
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.key),
              title: Text('Password',
                  style: TextStyle(color: AppColors.white.color)),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.payment),
              title: Text('Payment methods',
                  style: TextStyle(color: AppColors.white.color)),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.delete_forever),
              title: Text('Delete account',
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
                  'Log Out',
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
