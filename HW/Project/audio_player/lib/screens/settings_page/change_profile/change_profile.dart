import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/screens/settings_page/change_profile/platform_image/image_picker.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChangeUserinfo extends StatefulWidget {
  const ChangeUserinfo({super.key});

  @override
  State<ChangeUserinfo> createState() => _ChangeUserinfoState();
}

class _ChangeUserinfoState extends State<ChangeUserinfo> {
  late TextEditingController _userNameTextController;
  FirebaseStorage storage = FirebaseStorage.instance;

  User? _user;

  String? imageUrl;
  ImagePickerService imagePickerService = ImagePickerService();
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
  }

  @override
  void dispose() {
    super.dispose();
    _userNameTextController.dispose();
  }

  Future<void> pickAndUploadImage() async {
    final imageUrl = await imagePickerService.pickImageFromGallery();
    print(imageUrl);
    if (imageUrl != null) {
      setState(() {
        this.imageUrl = imageUrl;
        print(imageUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background.color,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150 / 2),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: imageUrl != null
                          ? Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            )
                          : _user?.photoURL == null
                              ? Image.network(
                                  imagesMap[Images.userPhoto]!,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(_user!.photoURL!,
                                  fit: BoxFit.cover),
                    ),
                  ),
                  PlatformBuilder(
                      web: TextButton(
                          onPressed: () {
                            pickAndUploadImage();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.changePhotoButton,
                            style: TextStyle(
                                color: AppColors.accent.color,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.accent.color,
                                decorationStyle: TextDecorationStyle.solid,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )),
                      other: TextButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoActionSheet(
                                      actions: <Widget>[
                                        CupertinoActionSheetAction(
                                            isDefaultAction: true,
                                            child: Row(
                                              children: [
                                                Icon(Icons.image,
                                                    color:
                                                        AppColors.black.color),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .galleryButton,
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.black.color,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              pickAndUploadImage();
                                      
                                            }),
                                        CupertinoActionSheetAction(
                                          child: Row(
                                            children: [
                                              Icon(Icons.camera_alt,
                                                  color: AppColors.black.color),
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .cameraButton,
                                                style: TextStyle(
                                                    color:
                                                        AppColors.black.color,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            // pickImageCamera();
                                          },
                                        ),
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .cancelButton,
                                          style: TextStyle(
                                              color: AppColors.accent.color,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.changePhotoButton,
                            style: TextStyle(
                                color: AppColors.accent.color,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.accent.color,
                                decorationStyle: TextDecorationStyle.solid,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )),
                      builder: (context, child, widget) {
                        return widget;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _CreateChangeNameTextField(
                        userNameTextController: _userNameTextController),
                  ),
                  Text(
                    AppLocalizations.of(context)!.changeNameDesc,
                    style:
                        TextStyle(color: AppColors.white.color, fontSize: 10),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      onPressed: () {
                        _saveData();
                        context.pop();
                      },
                      buttonText: AppLocalizations.of(context)!.saveButton)
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> uploadFile() async {
    if (imageUrl == null) return;
    await _user?.updatePhotoURL(imageUrl);
  }

  void _saveData() async {
    await uploadFile();

    if (_userNameTextController.text.isNotEmpty) {
      await _user?.updateDisplayName(_userNameTextController.text);
    }
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
      placeholder: AppLocalizations.of(context)!.changeNameTextFieldHintText,
      placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColors.white.color, fontSize: 18),
    );
  }
}

class ImagePickerActionSheet extends StatelessWidget {
  final VoidCallback getPhotoFromLibrary;
  final VoidCallback getPhotoFromCamera;
  const ImagePickerActionSheet(
      {super.key,
      required this.getPhotoFromCamera,
      required this.getPhotoFromLibrary});

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
                  AppLocalizations.of(context)!.galleryButton,
                  style: TextStyle(
                      color: AppColors.black.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            onPressed: () {
              getPhotoFromLibrary;
            }),
        CupertinoActionSheetAction(
          child: Row(
            children: [
              Icon(Icons.camera_alt, color: AppColors.black.color),
              Text(
                AppLocalizations.of(context)!.cameraButton,
                style: TextStyle(
                    color: AppColors.black.color,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          onPressed: () {
            getPhotoFromCamera;
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          AppLocalizations.of(context)!.cancelButton,
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
