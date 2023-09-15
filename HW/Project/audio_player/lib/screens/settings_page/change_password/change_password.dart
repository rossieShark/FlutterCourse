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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late FocusNode _passwordFocusNode;
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        obscureText: obscureText,
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        hintText: AppLocalizations.of(context)!.changePassword,
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        obscureText: newObscureText,
                        controller: _newPasswordController,
                        focusNode: _newPasswordFocusNode,
                        hintText: AppLocalizations.of(context)!.confirmPassword,
                      ),
                    ),
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
                  height: 50,
                ),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          AppColors.accent.color,
                          AppColors.darkAccent.color,
                        ],
                      )),
                  child: TextButton(
                      onPressed: () {
                        _changePassword();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.changebutton,
                        style: TextStyle(
                            color: AppColors.white.color,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
