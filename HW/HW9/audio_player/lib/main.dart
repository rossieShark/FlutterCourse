import 'package:audio_player/app_logic/blocs/tab_bar_bloc.dart';
import 'package:audio_player/screens/tab_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<TabBarBloc>(create: (context) => TabBarBloc()),
    ], child: const TabBarScreen()),
  );
}
