import 'package:audio_player/databases/database.dart';

import 'package:audio_player/screens/tab_bar/tab_bar_screen.dart';
import 'package:audio_player/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app_logic/blocs/bloc_exports.dart';

void main() {
  setupDependencies();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<TabBarBloc>(create: (context) => TabBarBloc()),
    ], child: const TabBarScreen()),
  );
}

void setupDependencies() {
  GetIt.I.registerSingleton<RecentlyPlayedRepository>(
    RecentlyPlayedRepository(MyDatabaseSingleton.instance),
  );
  GetIt.I.registerSingleton<FavoriteArtistRepository>(
    FavoriteArtistRepository(MyDatabaseSingleton.instance),
  );
  GetIt.I.registerSingleton<BestAlbumRepository>(
    BestAlbumRepository(MyDatabaseSingleton.instance),
  );
  GetIt.I.registerSingleton<AlbumDetailsRepository>(
    AlbumDetailsRepository(MyDatabaseSingleton.instance),
  );
  GetIt.I.registerSingleton<FavoriteProvider>(
    FavoriteProvider(MyDatabaseSingleton.instance),
  );

  GetIt.I.registerSingleton<RecentlySearchedProvider>(
    RecentlySearchedProvider(MyDatabaseSingleton.instance),
  );
  // Add more registrations as needed
}

class MyDatabaseSingleton {
  static AudioDatabase? _instance;

  static AudioDatabase get instance {
    _instance ??= AudioDatabase(); // Initialize if not already initialized
    return _instance!;
  }
}
