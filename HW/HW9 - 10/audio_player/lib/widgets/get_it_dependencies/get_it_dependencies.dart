import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/databases/database.dart';
import 'package:audio_player/services/services.dart';
import 'package:get_it/get_it.dart';

class SetGetItDependencies {
  void setupDatabaseDependencies() {
    GetIt.I.registerLazySingleton<AudioDatabase>(AudioDatabase.new);
  }

  void setupProviderDependencies() {
    GetIt.instance.registerLazySingleton<FavoriteProvider>(
      () => FavoriteProvider(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<RecentlySearchedProvider>(
      () => RecentlySearchedProvider(GetIt.instance.get()),
    );
  }

  void setupRepoDependencies() {
    GetIt.instance.registerLazySingleton<RecentlyPlayedRepository>(
      () => RecentlyPlayedRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<FavoriteArtistRepository>(
      () => FavoriteArtistRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<BestAlbumRepository>(
      () => BestAlbumRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<AlbumDetailsRepository>(
      () => AlbumDetailsRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<GenresRepository>(
      () => GenresRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<SongDetailRepository>(
      () => SongDetailRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<AlbumRepository>(
      AlbumRepository.new,
    );
    GetIt.instance.registerLazySingleton<SearchRepository>(
      SearchRepository.new,
    );
  }

  void setupBlocDependencies() {
    GetIt.I.registerSingleton<TabBarBloc>(
      TabBarBloc(),
    );
    GetIt.instance
        .registerFactory<AlbumBloc>(() => AlbumBloc(GetIt.instance.get()));

    GetIt.instance.registerFactory<FavoriteArtistBloc>(
        () => FavoriteArtistBloc(GetIt.instance.get()));

    GetIt.instance.registerFactory<RecentlyPlayedBloc>(
        () => RecentlyPlayedBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<SearchResultBloc>(
        () => SearchResultBloc(GetIt.instance.get()));
    GetIt.instance
        .registerFactory<GenresBloc>(() => GenresBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<RecentlySearchedBloc>(
        () => RecentlySearchedBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<AlbumDetailBloc>(
        () => AlbumDetailBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<FavoriteBloc>(
        () => FavoriteBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<DetailMusicPageBloc>(
        () => DetailMusicPageBloc(GetIt.instance.get()));
  }
}
