import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';

import 'package:audio_player/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('FavoriteArtistBloc', () {
    late FavoriteArtistBloc favoriteArtistBloc;
    late MockFavoriteArtistRepository repository;

    setUp(() {
      repository = MockFavoriteArtistRepository();
      favoriteArtistBloc = FavoriteArtistBloc(repository);
    });

    blocTest<FavoriteArtistBloc, FavoriteArtistState>(
      'emits FavoriteArtistBloc when FetchFavoriteArtistsEvent is added',
      build: () {
        // Mock the scenario where getTracksFromDb returns non-empty data
        when(() => repository.getTracksFromDb()).thenAnswer((_) async => [
              const FavoriteArtist(id: 1, image: 'image', name: 'name'),
            ]);
        return favoriteArtistBloc;
      },
      act: (bloc) => bloc.add(FetchFavoriteArtistsEvent()),
      expect: () => [
        // Check that the bloc emits a FavoriteArtistState with data from getTracksFromDb
        isA<FavoriteArtistState>().having(
          (state) => state.favoriteArtistList,
          'favoriteArtists',
          contains(const FavoriteArtist(id: 1, image: 'image', name: 'name')),
        ),
      ],
    );

    blocTest<FavoriteArtistBloc, FavoriteArtistState>(
      'emits FavoriteArtistBloc when FetchFavoriteArtistsEvent is added with empty tracks',
      build: () {
        // Mock the scenario where getTracksFromDb returns an empty list
        when(() => repository.getTracksFromDb()).thenAnswer((_) async => []);
        // Mock the scenario where getFavoriteArtists returns some artists
        when(() => repository.getFavoriteArtists()).thenAnswer((_) async => [
              const FavoriteArtist(id: 2, image: 'image2', name: 'name2'),
            ]);
        return favoriteArtistBloc;
      },
      act: (bloc) => bloc.add(FetchFavoriteArtistsEvent()),
      expect: () => [
        // Check that the bloc emits a FavoriteArtistState with data from getFavoriteArtists
        isA<FavoriteArtistState>().having(
          (state) => state.favoriteArtistList,
          'favoriteArtists',
          contains(const FavoriteArtist(id: 2, image: 'image2', name: 'name2')),
        ),
      ],
    );
  });
}

class MockFavoriteArtistRepository extends Mock
    implements FavoriteArtistRepository {}
