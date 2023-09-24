import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Image.asset(
                  imagesMap[Images.appIcon]!,
                ),
              ),
              Text('Louder',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.colombia.font,
                    color: Colors.white,
                  )),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    width: 140,
                    onPressed: () {
                      context.go(routeNameMap[RouteName.sigIn]!);
                    },
                    buttonText: AppLocalizations.of(context)!.signInButton),
                const SizedBox(
                  width: 30,
                ),
                CustomButton(
                    width: 140,
                    onPressed: () {
                      context.go(routeNameMap[RouteName.signUp]!);
                    },
                    buttonText: AppLocalizations.of(context)!.signUpButton),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
