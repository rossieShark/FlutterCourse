import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockFavoriteProvider extends Mock implements FavoriteProvider {}

void main() {
  late FavoriteBloc favoriteBloc;
  late MockFavoriteProvider mockFavoriteProvider;
  setUpAll(() {
    registerFallbackValue(SongModel(
      id: 'defaultId',
      title: 'defaultTitle',
      artistNames: 'defaultArtistNames',
      image: 'defaultImage',
      type: 'defaultType',
      preview: 'defaultPreview',
    ));
  });

  setUp(() {
    mockFavoriteProvider = MockFavoriteProvider();
    favoriteBloc = FavoriteBloc(mockFavoriteProvider);
  });

  tearDown(() {
    favoriteBloc.close();
  });

  blocTest<FavoriteBloc, FavoriteState>(
    'emits FavoriteSongUpdatedState when ToggleFavoriteSongEvent is added',
    build: () {
      when(() => mockFavoriteProvider.isFavoriteSong('songId'))
          .thenReturn(false);
      when(() => mockFavoriteProvider.addToFavorites(any()))
          .thenAnswer((_) async {});
      when(() => mockFavoriteProvider.removeFromFavorites(any()))
          .thenAnswer((_) async {});
      return favoriteBloc;
    },
    act: (bloc) => bloc.add(ToggleFavoriteSongEvent(createSong())),
    expect: () => [
      isA<FavoriteSongUpdatedState>(),
    ],
    verify: (_) {
      verify(() => mockFavoriteProvider.isFavoriteSong('songId')).called(1);
      verify(() => mockFavoriteProvider.addToFavorites(any())).called(1);
      verifyNever(() => mockFavoriteProvider.removeFromFavorites(any()));
    },
  );

  blocTest<FavoriteBloc, FavoriteState>(
    'emits FavoriteSongUpdatedState when ToggleFavoriteSongEvent is added',
    build: () {
      when(() => mockFavoriteProvider.isFavoriteSong('songId'))
          .thenReturn(true);
      when(() => mockFavoriteProvider.addToFavorites(any()))
          .thenAnswer((_) async {});
      when(() => mockFavoriteProvider.removeFromFavorites(any()))
          .thenAnswer((_) async {});
      return favoriteBloc;
    },
    act: (bloc) => bloc.add(ToggleFavoriteSongEvent(createSong())),
    expect: () => [
      isA<FavoriteSongUpdatedState>(),
    ],
    verify: (_) {
      verify(() => mockFavoriteProvider.isFavoriteSong('songId')).called(1);
      verify(() => mockFavoriteProvider.removeFromFavorites(any())).called(1);
      verifyNever(() => mockFavoriteProvider.addToFavorites(any()));
    },
  );

  blocTest<FavoriteBloc, FavoriteState>(
    'emits FavoriteSongUpdatedState when ToggleFavoriteSongEvent is added',
    build: () {
      when(() => mockFavoriteProvider.isFavoriteAlbum('songId'))
          .thenReturn(false);
      when(() => mockFavoriteProvider.addToFavoritesAlbum(any()))
          .thenAnswer((_) async {});
      when(() => mockFavoriteProvider.removeFromFavoritesAlbum(any()))
          .thenAnswer((_) async {});
      return favoriteBloc;
    },
    act: (bloc) => bloc.add(ToggleFavoriteAlbumEvent(createSong())),
    expect: () => [
      isA<FavoriteAlbumUpdatedState>(),
    ],
    verify: (_) {
      verify(() => mockFavoriteProvider.isFavoriteAlbum('songId')).called(1);
      verify(() => mockFavoriteProvider.addToFavoritesAlbum(any())).called(1);
      verifyNever(() => mockFavoriteProvider.removeFromFavoritesAlbum(any()));
    },
  );

  blocTest<FavoriteBloc, FavoriteState>(
    'emits FavoriteSongUpdatedState when ToggleFavoriteAlbumEvent is added',
    build: () {
      when(() => mockFavoriteProvider.isFavoriteAlbum('songId'))
          .thenReturn(true);
      when(() => mockFavoriteProvider.addToFavoritesAlbum(any()))
          .thenAnswer((_) async {});
      when(() => mockFavoriteProvider.removeFromFavoritesAlbum(any()))
          .thenAnswer((_) async {});
      return favoriteBloc;
    },
    act: (bloc) => bloc.add(ToggleFavoriteAlbumEvent(createSong())),
    expect: () => [
      isA<FavoriteAlbumUpdatedState>(),
    ],
    verify: (_) {
      verify(() => mockFavoriteProvider.isFavoriteAlbum('songId')).called(1);
      verify(() => mockFavoriteProvider.removeFromFavoritesAlbum(any()))
          .called(1);
      verifyNever(() => mockFavoriteProvider.addToFavoritesAlbum(any()));
    },
  );
}

SongModel createSong() {
  return SongModel(
    id: "songId",
    title: "title",
    artistNames: "artistNames",
    image: "image",
    type: "track",
    preview: "preview",
  );
}
