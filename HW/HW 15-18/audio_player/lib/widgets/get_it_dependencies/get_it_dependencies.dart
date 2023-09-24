import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/services/search_result/search_result_service.dart';

import 'package:audio_player/services/service.dart';
import 'package:audio_player/services/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';

class SetGetItDependencies {
  void setupDatabaseDependencies() {
    GetIt.I.registerLazySingleton<AudioAppDatabase>(AudioAppDatabase.new);
  }

  void setupProviderDependencies() {
    GetIt.instance.registerLazySingleton<FavoriteProvider>(
      () => FavoriteProvider(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<RecentlySearchedProvider>(
      () => RecentlySearchedProvider(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<MyMusicFoldersProvider>(
      () => MyMusicFoldersProvider(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<MusicProvider>(
      () => MusicProvider(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<LanguageProvider>(
      () => LanguageProvider(),
    );
    GetIt.instance.registerLazySingleton<AudioPlayer>(
      () => AudioPlayer(),
    );
  }

  void setupRepoDependencies() {
    GetIt.instance.registerLazySingleton<RecentlyPlayedRepository>(
      () =>
          RecentlyPlayedRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<FavoriteArtistRepository>(
      () =>
          FavoriteArtistRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<BestAlbumRepository>(
        () => BestAlbumRepository(GetIt.instance.get(), GetIt.instance.get()));

    GetIt.instance.registerLazySingleton<AlbumDetailsRepository>(
      () => AlbumDetailsRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<GenresRepository>(
      () => GenresRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<SongDetailRepository>(
      () => SongDetailRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<SearchResultRepository>(
      () => SearchResultRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<AlbumRepository>(
      () => AlbumRepository(GetIt.instance.get()),
    );

    GetIt.instance.registerLazySingleton<SearchRepository>(
        () => SearchRepository(GetIt.instance.get()));
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

  void setupServiceDependencies() {
    GetIt.instance.registerLazySingleton(() => AudioPlayerService.create());

    GetIt.instance.registerFactory<BestAlbumsPaginationService>(
        () => BestAlbumsPaginationService(GetIt.instance.get()));

    GetIt.instance.registerFactory<SearchResultPaginationService>(
        () => SearchResultPaginationService(GetIt.instance.get()));
  }
}
