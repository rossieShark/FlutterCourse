import 'package:firebase/screens/login_screen.dart';
import 'package:firebase/screens/profile_screen.dart';
import 'package:firebase/screens/sign_up_screen.dart';
import 'package:firebase/screens/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final router =
    GoRouter(initialLocation: routeNameMap[RouteName.profile]!, routes: [
  GoRoute(
      path: routeNameMap[RouteName.start]!,
      pageBuilder: (context, state) => const CupertinoPage(
            child: StartPage(),
          )),
  GoRoute(
    path: routeNameMap[RouteName.sigIn]!,
    pageBuilder: (context, state) => const CupertinoPage(
      child: LoginPage(),
    ),
  ),
  GoRoute(
    path: routeNameMap[RouteName.signUp]!,
    pageBuilder: (context, state) => const CupertinoPage(
      child: SignUpPage(),
    ),
  ),
  GoRoute(
    path: routeNameMap[RouteName.profile]!,
    pageBuilder: (context, state) => const CupertinoPage(
      child: ProfilePage(),
    ),
    redirect: (BuildContext context, GoRouterState state) {
      final FirebaseAuth auth = FirebaseAuth.instance;
      if (auth.currentUser == null) {
        return routeNameMap[RouteName.start]!;
      } else {
        return null;
      }
    },
  )
]);

enum RouteName {
  profile,
  sigIn,
  signUp,
  start,
}

Map<RouteName, String> routeNameMap = {
  RouteName.profile: '/profile',
  RouteName.sigIn: '/signin',
  RouteName.signUp: '/signup',
  RouteName.start: '/start',
};
