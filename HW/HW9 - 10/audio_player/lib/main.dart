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
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<TabBarBloc>(create: (context) => GetIt.I()),
    ], child: const TabBarScreen()),
  );
}
