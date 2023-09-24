// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _passwordController;
  late TextEditingController _newPasswordController;

  late FocusNode _passwordFocusNode;
  String resultText = '';
  late FocusNode _newPasswordFocusNode;
  late User? _user;
  bool obscureText = true;
  bool newObscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _newPasswordFocusNode = FocusNode();
    _newPasswordFocusNode.addListener(() {
      setState(() {});
    });
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<void> _changePassword() async {
    if (_passwordController.text == _newPasswordController.text) {
      await _user?.updatePassword(_passwordController.text);
      context.pop();
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            SignAlert(text: AppLocalizations.of(context)!.passwordMissmatch),
      );
    }
  }

  Future<void> _changePasswordWeb() async {
    if (_passwordController.text == _newPasswordController.text) {
      await _user?.updatePassword(_passwordController.text);
      context.pop();
    } else {
      setState(() {
        resultText = AppLocalizations.of(context)!.passwordMissmatch;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _passwordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background.color,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlatformBuilder(
                        web: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            width: MediaQuery.of(context).size.width / 2.6,
                            obscureText: obscureText,
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            onChanged: (text) {
                              setState(() {
                                resultText = '';
                              });
                            },
                            hintText:
                                AppLocalizations.of(context)!.changePassword,
                          ),
                        ),
                        other: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            width: MediaQuery.of(context).size.width / 1.5,
                            obscureText: obscureText,
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            onChanged: (text) {
                              setState(() {
                                resultText = '';
                              });
                            },
                            hintText:
                                AppLocalizations.of(context)!.changePassword,
                          ),
                        ),
                        builder: (context, child, widget) {
                          return widget;
                        }),
                    IconButtonWidget(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        color: AppColors.white.color,
                        iconData: !obscureText
                            ? Icons.visibility
                            : Icons.visibility_off)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlatformBuilder(
                        web: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            width: MediaQuery.of(context).size.width / 2.6,
                            obscureText: newObscureText,
                            controller: _newPasswordController,
                            focusNode: _newPasswordFocusNode,
                            onChanged: (text) {
                              setState(() {
                                resultText = '';
                              });
                            },
                            hintText:
                                AppLocalizations.of(context)!.confirmPassword,
                          ),
                        ),
                        other: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            width: MediaQuery.of(context).size.width / 1.5,
                            obscureText: newObscureText,
                            controller: _newPasswordController,
                            focusNode: _newPasswordFocusNode,
                            onChanged: (text) {
                              setState(() {
                                resultText = '';
                              });
                            },
                            hintText:
                                AppLocalizations.of(context)!.confirmPassword,
                          ),
                        ),
                        builder: (context, child, widget) {
                          return widget;
                        }),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: CustomTextField(
                    //     width: MediaQuery.of(context).size.width / 2.4,
                    //     obscureText: newObscureText,
                    //     controller: _newPasswordController,
                    //     focusNode: _newPasswordFocusNode,
                    //     onChanged: (text) {
                    //       setState(() {
                    //         resultText = '';
                    //       });
                    //     },
                    //     hintText: AppLocalizations.of(context)!.confirmPassword,
                    //   ),
                    // ),
                    IconButtonWidget(
                        onPressed: () {
                          setState(() {
                            newObscureText = !newObscureText;
                          });
                        },
                        color: AppColors.white.color,
                        iconData: !newObscureText
                            ? Icons.visibility
                            : Icons.visibility_off)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  resultText,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                PlatformBuilder(
                    web: CustomButton(
                        width: 120,
                        onPressed: () {
                          _changePasswordWeb();
                        },
                        buttonText: AppLocalizations.of(context)!.changebutton),
                    other: CustomButton(
                        width: 120,
                        onPressed: () {
                          _changePassword();
                        },
                        buttonText: AppLocalizations.of(context)!.changebutton),
                    builder: (context, child, widget) {
                      return widget;
                    })
              ],
            ),
          ),
        ));
  }
}
