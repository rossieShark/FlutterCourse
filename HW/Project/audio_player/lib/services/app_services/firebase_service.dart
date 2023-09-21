// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/widgets/app_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseFunctions {
  Future<bool> signInWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      FirebaseAuth.instance.userChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      final googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      print('Error google signing in: $e');
      return false;
    }
  }

  Future<void> validSignWithGoogle(BuildContext context) async {
    bool success = await FireBaseFunctions().signInWithGoogle();
    if (success) {
      return context.go(routeNameMap[RouteName.home]!);
    } else {
      await showDialog(
        context: context,
        builder: (context) =>
            SignAlert(text: AppLocalizations.of(context)!.googleSignError),
      );
    }
  }

  void resetPassword(BuildContext context, TextEditingController controller) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(AppLocalizations.of(context)!.resetPassword),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextField(
            controller: controller,
            placeholder: AppLocalizations.of(context)!.enterEmail,
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(AppLocalizations.of(context)!.sendButton),
            onPressed: () async {
              await FirebaseAuth.instance.sendPasswordResetEmail(
                email: controller.text,
              );
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text(AppLocalizations.of(context)!.cancelButton),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print('Error signing in: $e');
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print('Error signing up: $e');
      return false;
    }
  }
}
