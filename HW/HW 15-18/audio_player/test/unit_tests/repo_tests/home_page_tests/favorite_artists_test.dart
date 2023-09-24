import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/services/home_screen_service/home_service.dart';
import 'package:audio_player/services/service.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final audioDatabase = AudioDatabaseMock();
  final audioPlayerServiceMock = AudioPlayerServiceMock();
  final favoriteArtistRepository =
      FavoriteArtistRepository(audioDatabase, audioPlayerServiceMock);

  group('FavoriteArtistRepository', () {
    group('cacheTracks', () {
      test('should cache artists in the database', () async {
        // Arrange
        final tracks = [Artists(id: 1, image: 'image', name: 'name')];

        // Act
        final result = await favoriteArtistRepository.cacheTracks(tracks);

        // Assert
        expect(result, isNotNull);
      });
    });

    group('getTracksFromDb', () {
      test('should return a list of FavoriteArtist from the database',
          () async {
        // Arrange
        when(() => audioDatabase.getallFavouriteArtists())
            .thenAnswer((_) => Future.value(createFavoriteTestList()));

        // Act
        final result = await favoriteArtistRepository.getTracksFromDb();

        // Assert
        expect(result, isNotNull);
        expect(result.length, 2);
        expect(result[0].name, 'Artist1');
        expect(result[1].name, 'Artist2');
      });
    });

    group('getFavoriteArtists', () {
      test('should return artists from the database when available', () async {
        // Arrange
        when(() => audioDatabase.getallFavouriteArtists())
            .thenAnswer((_) => Future.value(createFavoriteTestList()));
        // Act
        final result = await favoriteArtistRepository.getFavoriteArtists();

        // Assert
        expect(result, isNotNull);
        expect(result.length, 2);
        expect(result[0].name, 'Artist1');
        expect(result[1].name, 'Artist2');

        verifyNever(() => audioPlayerServiceMock.getFavoriteArtists());
      });

      test(
          'should return artists from the service when not available in the database',
          () async {
        // Arrange
        when(() => audioDatabase.getallFavouriteArtists())
            .thenAnswer((_) => Future.value([]));

        final artistsResponse = createTestArtistsResponse();

        final response = createTestResponse(artistsResponse);

        when(() => audioPlayerServiceMock.getFavoriteArtists())
            .thenAnswer((_) => Future.value(response));

        // Act
        final result = await favoriteArtistRepository.getFavoriteArtists();

        // Assert
        expect(result, isNotNull);
        expect(result.length, 1);
        expect(result[0].name, 'name');

        verify(() => audioPlayerServiceMock.getFavoriteArtists()).called(1);
      });
    });
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  @override
  Future<void> addManyFavoriteArtists(List<FavoriteArtist> artists) async {
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
List<FavoriteArtist> createFavoriteTestList() {
  return [
    const FavoriteArtist(name: 'Artist1', id: 1, image: 'image'),
    const FavoriteArtist(name: 'Artist2', id: 2, image: 'image'),
  ];
}

FavouriteArtistResponse createTestArtistsResponse() {
  return FavouriteArtistResponse(
      data: [Artists(id: 1, image: 'image', name: 'name')]);
}

Response<FavouriteArtistResponse> createTestResponse(
    FavouriteArtistResponse data) {
  return Response<FavouriteArtistResponse>(
    http.Response('response_body', 200),
    data,
  );
}
