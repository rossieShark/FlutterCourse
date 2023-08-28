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
      BlocProvider<TabBarBloc>(create: (context) => GetIt.I()),
    ], child: const TabBarScreen()),
  );
}

void setupDependencies() {
  GetIt.I.registerSingleton<TabBarBloc>(
    TabBarBloc(),
  );
  GetIt.I.registerSingleton<AudioDatabase>(AudioDatabase());

  GetIt.I.registerSingleton<RecentlyPlayedRepository>(
    RecentlyPlayedRepository(GetIt.I<AudioDatabase>()),
  );
  GetIt.I.registerSingleton<FavoriteArtistRepository>(
    FavoriteArtistRepository(GetIt.I<AudioDatabase>()),
  );
  GetIt.I.registerSingleton<BestAlbumRepository>(
    BestAlbumRepository(GetIt.I<AudioDatabase>()),
  );
  GetIt.I.registerSingleton<AlbumDetailsRepository>(
    AlbumDetailsRepository(GetIt.I<AudioDatabase>()),
  );
  GetIt.I.registerSingleton<GenresRepository>(
    GenresRepository(GetIt.I<AudioDatabase>()),
  );
  GetIt.I.registerSingleton<FavoriteProvider>(
    FavoriteProvider(GetIt.I<AudioDatabase>()),
  );
  GetIt.I.registerSingleton<RecentlySearchedProvider>(
    RecentlySearchedProvider(GetIt.I<AudioDatabase>()),
  );
  GetIt.I.registerSingleton<SongDetailRepository>(
    SongDetailRepository(GetIt.I<AudioDatabase>()),
  );
  GetIt.I.registerSingleton<FavoriteArtistBloc>(
    FavoriteArtistBloc(GetIt.I<FavoriteArtistRepository>()),
  );
}
