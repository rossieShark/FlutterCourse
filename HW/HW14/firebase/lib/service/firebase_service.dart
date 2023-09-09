// ignore_for_file: use_build_context_synchronously

import 'package:firebase/go_router.dart';
import 'package:firebase/widgets/index.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseFunctions {
  Future<bool> signInWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      FirebaseAuth.instance.userChanges().listen((User? user) {});
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
      return false; // Sign-in failed
    }
  }

  Future<void> validSignWithGoogle(BuildContext context) async {
    bool success = await FireBaseFunctions().signInWithGoogle();
    if (success) {
      return context.go(routeNameMap[RouteName.profile]!);
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const SignAlert(text: 'Error when trying to register via Google.'),
      );
    }
  }

  void resetPassword(BuildContext context, TextEditingController controller) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Reset password'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextField(
            controller: controller,
            placeholder:
                'Please enter your email', // Use 'placeholder' for hint text
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Sent'),
            onPressed: () async {
              await FirebaseAuth.instance.sendPasswordResetEmail(
                email: controller.text,
              );
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Cancel'),
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
      return true; // Sign-in was successful
    } catch (e) {
      print('Error signing in: $e');
      return false; // Sign-in failed
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
      return false; // Sign-in failed
    }
  }
}
