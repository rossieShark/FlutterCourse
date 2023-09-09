import 'package:firebase/firebase_options.dart';
import 'package:firebase/go_router.dart';
import 'package:firebase/service/media_service.dart';
import 'package:firebase/service/media_service_interface.dart';
import 'package:firebase/service/permission_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get_it/get_it.dart';

Future<void> main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<PermissionService>(
      PermissionHandlerPermissionService());

  getIt.registerSingleton<MediaServiceInterface>(MediaService());
}
