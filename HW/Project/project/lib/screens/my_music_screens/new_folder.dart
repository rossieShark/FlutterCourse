import 'package:project/models/favorite_folder_model.dart';
import 'package:project/screens/my_music_screens/my_music_screen.dart';
import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewFolder extends StatefulWidget {
  const NewFolder({super.key});

  @override
  State<NewFolder> createState() => _NewFolderState();
}

class _NewFolderState extends State<NewFolder> {
  late TextEditingController _newFolderTextField;
  @override
  void initState() {
    super.initState();
    _newFolderTextField = TextEditingController();
  }

  @override
  void dispose() {
    _newFolderTextField.dispose();
    super.dispose();
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
              height: MediaQuery.of(context).size.height - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Write the name of Playlist',
                    style: TextStyle(
                        color: AppColors.white.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _CreateChangeNameTextField(
                        userNameTextController: _newFolderTextField),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 140,
                    height: 40,
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
                          if (_newFolderTextField.text.isNotEmpty) {
                            setState(() {
                              folders.add(FavoriteFolder(
                                  title: _newFolderTextField.text,
                                  iconButton: IconButtonWidget(
                                      color: AppColors.white.color,
                                      iconData: Icons.arrow_forward_ios,
                                      onPressed: () {})));
                            });
                          }
                          context.pop();
                        },
                        child: Text(
                          'Create',
                          style: TextStyle(
                              color: AppColors.white.color,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ],
              ),
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
      placeholder: 'Name of playlist',
      placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColors.white.color, fontSize: 18),
    );
  }
}
