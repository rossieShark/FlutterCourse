import 'package:firebase/go_router.dart';
import 'package:firebase/screens/change_profile.dart';
import 'package:firebase/widgets/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: unused_field
  late User? _user;
  Stream<String?> get userNameStream {
    return _auth.authStateChanges().map((user) => user?.displayName);
  }

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
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      print('User signed out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: AppColors.background.color,
            appBar: AppBar(
              backgroundColor: AppColors.background.color,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white.color,
                ),
                onPressed: () {
                  _signOut();
                  context.go(routeNameMap[RouteName.sigIn]!);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: AppColors.accent.color,
                  ),
                  onPressed: () {
                    _signOut();
                    context.go(routeNameMap[RouteName.sigIn]!);
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(130 / 2),
                          child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  color: AppColors.background.color),
                              child: Image.network(
                                snapshot.data?.photoURL ??
                                    'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-File.png',
                                fit: BoxFit.cover,
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data?.displayName ?? 'User',
                              style: TextStyle(
                                  color: AppColors.white.color, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '0 followers﹒0 subscriptions',
                              style: TextStyle(
                                  color: AppColors.white.color, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const _CreateCnangeInfoButton(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.white.color, width: 1))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('No action stories',
                        style: TextStyle(color: AppColors.white.color)),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _CreateCnangeInfoButton extends StatelessWidget {
  const _CreateCnangeInfoButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => modal.showBarModalBottomSheet(
        // Use the alias here
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => const ChangeUserinfo(),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.accent.color),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Change',
                  style: TextStyle(color: AppColors.white.color),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.ios_share,
                  color: AppColors.white.color,
                )),
            IconButton(
                onPressed: () {},
                icon:
                    Icon(Icons.keyboard_control, color: AppColors.white.color)),
          ],
        ),
      ),
    );
  }
}
