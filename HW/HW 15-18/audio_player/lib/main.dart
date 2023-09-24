import 'package:audio_player/firebase_options.dart';
import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/screens/tab_bar/audio_player_app.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app_logic/blocs/bloc_exports.dart';

void main() async {
  SetGetItDependencies().setupDatabaseDependencies();
  SetGetItDependencies().setupProviderDependencies();
  SetGetItDependencies().setupRepoDependencies();
  SetGetItDependencies().setupBlocDependencies();
  SetGetItDependencies().setupServiceDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TabBarBloc>(create: (context) => GetIt.I()),
      ],
      child: ChangeNotifierProvider<LanguageProvider>(
        create: (context) => LanguageProvider(),
        child: PlatformBuilder(
            web: AudioPlayerApp(
              router: webRouter,
            ),
            other: AudioPlayerApp(
              router: router,
            ),
            builder: (context, child, widget) {
              return widget;
            }),
      ),
    ),
  );
}
