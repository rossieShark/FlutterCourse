import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';

import 'package:audio_player/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('FavoriteArtistBloc', () {
    late RecentlyPlayedBloc recentlyPlayedBloc;
    late MockRecentlyPlayedRepository repository;

    setUp(() {
      repository = MockRecentlyPlayedRepository();
      recentlyPlayedBloc = RecentlyPlayedBloc(repository);
    });

    blocTest<RecentlyPlayedBloc, RecentlyPlayedBlocState>(
      'emits FavoriteArtistBloc when FetchFavoriteArtistsEvent is added',
      build: () {
        // Mock the scenario where getTracksFromDb returns non-empty data
        when(() => repository.getTracksFromDb()).thenAnswer((_) async => [
              const RecentlyPlayedSong(
                  artistNames: 'artist',
                  headerImageUrl: 'image',
                  id: 1,
                  preview: 'preview',
                  title: 'track1',
                  type: 'track'),
            ]);
        return recentlyPlayedBloc;
      },
      act: (bloc) => bloc.add(FetchRecentlyPlayedEvent()),
      expect: () => [
        // Check that the bloc emits a FavoriteArtistState with data from getTracksFromDb
        isA<RecentlyPlayedBlocState>().having(
          (state) => state.recentlyPlayedtList,
          'recentlyPlayed',
          contains(
            const RecentlyPlayedSong(
                artistNames: 'artist',
                headerImageUrl: 'image',
                id: 1,
                preview: 'preview',
                title: 'track1',
                type: 'track'),
          ),
        ),
      ],
    );

    blocTest<RecentlyPlayedBloc, RecentlyPlayedBlocState>(
      'emits FavoriteArtistBloc when FetchFavoriteArtistsEvent is added with empty tracks',
      build: () {
        // Mock the scenario where getTracksFromDb returns an empty list
        when(() => repository.getTracksFromDb()).thenAnswer((_) async => []);
        // Mock the scenario where getFavoriteArtists returns some artists
        when(() => repository.getTracks()).thenAnswer((_) async => [
              const RecentlyPlayedSong(
                  artistNames: 'artist',
                  headerImageUrl: 'image',
                  id: 2,
                  preview: 'preview',
                  title: 'track2',
                  type: 'track'),
            ]);
        return recentlyPlayedBloc;
      },
      act: (bloc) => bloc.add(FetchRecentlyPlayedEvent()),
      expect: () => [
        // Check that the bloc emits a FavoriteArtistState with data from getFavoriteArtists
        isA<RecentlyPlayedBlocState>().having(
            (state) => state.recentlyPlayedtList,
            'recentlyPlayed',
            contains(
              const RecentlyPlayedSong(
                  artistNames: 'artist',
                  headerImageUrl: 'image',
                  id: 2,
                  preview: 'preview',
                  title: 'track2',
                  type: 'track'),
            )),
      ],
    );
  });
}

class MockRecentlyPlayedRepository extends Mock
    implements RecentlyPlayedRepository {}
