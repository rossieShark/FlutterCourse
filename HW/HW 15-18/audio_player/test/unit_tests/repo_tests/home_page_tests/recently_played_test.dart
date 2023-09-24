import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/recently_played_model/recently_played_model.dart';
import 'package:audio_player/services/home_screen_service/home_service.dart';
import 'package:audio_player/services/service.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final audioDatabase = AudioDatabaseMock();
  final audioPlayerServiceMock = AudioPlayerServiceMock();
  final recentlyPlayedRepository =
      RecentlyPlayedRepository(audioDatabase, audioPlayerServiceMock);

  group('FavoriteArtistRepository.casheTracks', () {
    test('Should cache artists in the database', () async {
      //arrange
      final tracks = [
        Data(
          id: 1,
          artist: Artist(id: 1, name: 'name', image: 'image'),
          preview: 'preview',
          title: 'title',
          type: 'type',
        )
      ];

      //act
      final result = await recentlyPlayedRepository.cacheTracks(tracks);

      //assert
      expect(result, isNotNull);
    });
  });

  group('getTracksFromDb', () {
    test('should return a list of RecentlyPlayedSong from the database',
        () async {
      // Arrange
      when(() => audioDatabase.getallRecentlyPlayedSongs())
          .thenAnswer((_) => Future.value([createTestSongs()]));

      // Act
      final result = await recentlyPlayedRepository.getTracksFromDb();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].type, 'track');
    });
  });

  group('FavoriteArtistRepository.getFavoriteArtists', () {
    test('Should return artists from the database when available', () async {
      //arrange
      when(() => audioDatabase.getallRecentlyPlayedSongs())
          .thenAnswer((_) => Future.value([createTestSongs()]));

      //act
      final result = await recentlyPlayedRepository.getTracks();

      //assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artistNames, 'Artist');
      verifyNever(() => audioPlayerServiceMock.getFavoriteArtists());
    });
  });

  test('Should return tracks from the service ', () async {
    //arrange

    when(() => audioDatabase.getallRecentlyPlayedSongs())
        .thenAnswer((_) => Future.value([]));
    final tracksResponse = createTestResentlyPlayedResponse();
    final response = createTestResponse(tracksResponse);

    when(() => audioPlayerServiceMock.getRecentlyPlayedTracks())
        .thenAnswer((_) => Future.value(response));
    //act
    final result = await recentlyPlayedRepository.getTracks();
    print(result);
    //assert
    expect(result, isNotNull);
    expect(result.length, 1);
    expect(result[0].id, 1);

    verify(() => audioPlayerServiceMock.getRecentlyPlayedTracks()).called(1);
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  @override
  Future<void> addManySongs(List<RecentlyPlayedSong> songs) async {
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
RecentlyPlayedSong createTestSongs() {
  return const RecentlyPlayedSong(
      artistNames: 'Artist',
      headerImageUrl: 'image',
      id: 1,
      preview: 'preview',
      title: 'title',
      type: 'track');
}

RecentlyPlayedResponse createTestResentlyPlayedResponse() {
  return RecentlyPlayedResponse(
      tracks: Tracks(data: [
    Data(
        title: 'title',
        artist: Artist(id: 1, image: 'image', name: 'name'),
        id: 1,
        preview: 'preview',
        type: 'type')
  ]));
}

Response<RecentlyPlayedResponse> createTestResponse(
    RecentlyPlayedResponse data) {
  return Response<RecentlyPlayedResponse>(
    http.Response('response_body', 200),
    data,
  );
}
