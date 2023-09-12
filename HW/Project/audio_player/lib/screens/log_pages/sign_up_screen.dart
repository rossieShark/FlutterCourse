// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/screens/log_pages/widgets/app_alert.dart';
import 'package:audio_player/screens/log_pages/widgets/custom_button.dart';
import 'package:audio_player/screens/log_pages/widgets/sign_methods.dart';
import 'package:audio_player/screens/log_pages/widgets/text_field.dart';

import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/services/firebase_service.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  late TextEditingController _signUpTextController;
  late TextEditingController _passwordTextController;
  late FocusNode _passwordFocusNode;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    _signUpTextController = TextEditingController();
    _signUpTextController.addListener(() {
      setState(() {});
    });
    _passwordTextController = TextEditingController();
    _passwordTextController.addListener(() {
      setState(() {});
    });
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _emailFocusNode = FocusNode();
    _emailFocusNode.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  Future<void> _signUp() async {
    bool success = await FireBaseFunctions()
        .register(_signUpTextController.text, _passwordTextController.text);
    if (success) {
      return context.go(routeNameMap[RouteName.home]!);
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const SignAlert(text: 'Invalid email or password'),
      );
    }
  }

  @override
  void dispose() {
    _signUpTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  imagesMap[Images.appIcon]!,
                  color: const Color.fromARGB(255, 171, 66, 122),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: CustomTextField(
                          focusNode: _emailFocusNode,
                          controller: _signUpTextController,
                          hintText: 'Enter email',
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: CustomTextField(
                            focusNode: _passwordFocusNode,
                            controller: _passwordTextController,
                            hintText: 'Enter passsword',
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    CustomButton(
                      onPressed: () {
                        _signUp();
                      },
                      buttonText: 'Sign Up',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Sign Up with',
                          style: TextStyle(
                              color: AppColors.white.color,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                    SignMethods(onGoogleTap: () {
                      // FireBaseFunctions().validSignWithGoogle(context);
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    const _CreateLoginWidget()
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
        ),
      ),
    );
  }
}

class _CreateLoginWidget extends StatelessWidget {
  const _CreateLoginWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(color: AppColors.white.color),
        ),
        GestureDetector(
            onTap: () {
              context.go(routeNameMap[RouteName.sigIn]!);
            },
            child: Text(
              "Sign In",
              style: TextStyle(color: AppColors.accent.color),
            )),
      ],
    );
  }
}
