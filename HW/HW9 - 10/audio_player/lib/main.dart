import 'package:audio_player/screens/tab_bar/additional_widgets/go_router.dart';
import 'package:audio_player/screens/tab_bar/tab_bar_screen.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app_logic/blocs/bloc_exports.dart';

void main() {
  SetGetItDependencies().setupDatabaseDependencies();
  SetGetItDependencies().setupProviderDependencies();
  SetGetItDependencies().setupRepoDependencies();
  SetGetItDependencies().setupBlocDependencies();
  //setUrlStrategy(PathUrlStrategy());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TabBarBloc>(create: (context) => GetIt.I()),
      ],
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
  );
}
