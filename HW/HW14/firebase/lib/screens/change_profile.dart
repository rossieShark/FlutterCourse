// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:firebase/main.dart';
import 'package:firebase/service/service.dart';
import 'package:firebase/widgets/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:go_router/go_router.dart';

class ChangeUserinfo extends StatefulWidget {
  const ChangeUserinfo({super.key});

  @override
  State<ChangeUserinfo> createState() => _ChangeUserinfoState();
}

class _ChangeUserinfoState extends State<ChangeUserinfo> {
  late TextEditingController _userNameTextController;

  final MediaServiceInterface _mediaService = getIt<MediaServiceInterface>();

  File? imageFile;
  User? _user;
  String profilePhoto =
      'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png';

  @override
  void initState() {
    super.initState();
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
    _userNameTextController = TextEditingController();
    _userNameTextController.addListener(() {
      setState(() {});
    });
  }

  // ignore: body_might_complete_normally_nullable
  Future<AppImageSource?> pickImageSource() async {
    AppImageSource? appImageSource = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => const ImagePickerActionSheet(),
    );
    if (appImageSource != null) {
      _getImage(appImageSource);
    }
  }

  Future _getImage(AppImageSource appImageSource) async {
    final pickedImageFile =
        await _mediaService.uploadImage(context, appImageSource);

    if (pickedImageFile != null) {
      setState(() => imageFile = pickedImageFile);
    }
  }

  void _saveData() async {
    if (imageFile != null) {
      final photoUrl = await changeImageFormat(imageFile!);
      _user?.updatePhotoURL(photoUrl);
    }
    if (_userNameTextController.text.isNotEmpty) {
      _user?.updateDisplayName(_userNameTextController.text);
    }

    context.pop(const ProfilePage());
  }

  @override
  void dispose() {
    super.dispose();
    _userNameTextController.dispose();
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
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(150 / 2),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.background.color,
                      image: imageFile == null
                          ? const DecorationImage(
                              image: NetworkImage(
                                  'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png'))
                          : DecorationImage(
                              image: FileImage(imageFile!),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      pickImageSource();
                    },
                    child: Text(
                      'Change photo',
                      style: TextStyle(
                          color: AppColors.accent.color,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.accent.color,
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _CreateChangeNameTextField(
                      userNameTextController: _userNameTextController),
                ),
                Text(
                  'This could be your first name or a nickname.',
                  style: TextStyle(color: AppColors.white.color, fontSize: 10),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                    onPressed: () {
                      _saveData();
                    },
                    buttonText: 'Save')
              ],
            ),
          ),
        ));
  }
}

class _CreateChangeNameTextField extends StatelessWidget {
  const _CreateChangeNameTextField({
    required TextEditingController userNameTextController,
  }) : _userNameTextController = userNameTextController;

  final TextEditingController _userNameTextController;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _userNameTextController,
      decoration: BoxDecoration(
        color: AppColors.background.color,
        border: Border(
          bottom: BorderSide(width: 1, color: AppColors.white.color),
        ),
      ),
      placeholder: 'Your name',
      placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColors.white.color, fontSize: 18),
    );
  }
}

class ImagePickerActionSheet extends StatelessWidget {
  const ImagePickerActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          isDefaultAction: true,
          child: Row(
            children: [
              Icon(Icons.image, color: AppColors.black.color),
              Text(
                ' Gallery',
                style: TextStyle(
                    color: AppColors.black.color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          onPressed: () => Navigator.of(context).pop(AppImageSource.camera),
        ),
        CupertinoActionSheetAction(
          child: Row(
            children: [
              Icon(Icons.camera_alt, color: AppColors.black.color),
              Text(
                ' Camera',
                style: TextStyle(
                    color: AppColors.black.color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          onPressed: () => Navigator.of(context).pop(AppImageSource.gallery),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          'Cancel',
          style: TextStyle(
              color: AppColors.accent.color,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
