// ignore_for_file: use_build_context_synchronously

import 'package:firebase/go_router.dart';
import 'package:firebase/service/service.dart';
import 'package:firebase/widgets/index.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _loginTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _resetPasswordTextController;
  late FocusNode _passwordFocusNode;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    _loginTextController = TextEditingController();
    _loginTextController.addListener(() {
      setState(() {});
    });
    _passwordTextController = TextEditingController();
    _passwordTextController.addListener(() {
      setState(() {});
    });
    _resetPasswordTextController = TextEditingController();
    _resetPasswordTextController.addListener(() {
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

  Future<void> _signIn() async {
    bool success = await FireBaseFunctions()
        .signIn(_loginTextController.text, _passwordTextController.text);
    if (success) {
      return context.go(routeNameMap[RouteName.profile]!);
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const SignAlert(text: 'Incorrect password or email'),
      );
    }
  }

  @override
  void dispose() {
    _loginTextController.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
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
                          controller: _loginTextController,
                          hintText: 'Enter email',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: CustomTextField(
                          focusNode: _passwordFocusNode,
                          controller: _passwordTextController,
                          hintText: 'Enter password',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _CreateForgetPasswordWidget(
                          resetPasswordTextController:
                              _resetPasswordTextController)
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
                          _signIn();
                        },
                        buttonText: 'Sign In'),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Be connect with',
                          style: TextStyle(
                              color: AppColors.white.color,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                    SignMethods(
                      onGoogleTap: () {
                        FireBaseFunctions().validSignWithGoogle(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const _CreateRegisterWidget()
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

class _CreateForgetPasswordWidget extends StatelessWidget {
  const _CreateForgetPasswordWidget({
    required TextEditingController resetPasswordTextController,
  }) : _resetPasswordTextController = resetPasswordTextController;

  final TextEditingController _resetPasswordTextController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FireBaseFunctions()
            .resetPassword(context, _resetPasswordTextController);
      },
      child: Align(
          alignment: Alignment.bottomRight,
          child: Text('Forgot password?',
              style: TextStyle(
                  color: AppColors.grey.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w400))),
    );
  }
}

class _CreateRegisterWidget extends StatelessWidget {
  const _CreateRegisterWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: AppColors.white.color),
        ),
        GestureDetector(
            onTap: () {
              context.go('/signup');
            },
            child: Text(
              "Sign Up",
              style: TextStyle(color: AppColors.accent.color),
            )),
      ],
    );
  }
}
