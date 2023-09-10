import 'package:firebase/go_router.dart';
import 'package:firebase/widgets/index.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:go_router/go_router.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  imagesMap[Images.appIcon]!,
                  color: AppColors.accent.color,
                ),
              ),
              const Text('App name',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey.color,
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
                    buttonText: 'Sign In'),
                const SizedBox(
                  width: 30,
                ),
                CustomButton(
                    width: 140,
                    onPressed: () {
                      context.go(routeNameMap[RouteName.signUp]!);
                    },
                    buttonText: 'Sign Up'),
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
