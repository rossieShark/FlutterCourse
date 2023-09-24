import 'package:audio_player/databases/database.dart';

import 'package:audio_player/models/models.dart';

import 'package:audio_player/services/home_screen_service/home_service.dart';
import 'package:audio_player/services/service.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final audioDatabase = AudioDatabaseMock();
  final audioPlayerServiceMock = AudioPlayerServiceMock();
  final bestAlbumRepository =
      BestAlbumRepository(audioDatabase, audioPlayerServiceMock);

  group('BestAlbumRepository', () {
    group('cacheAlbums', () {
      test('should cache albums in the database', () async {
        // Arrange
        final albums = [
          BestAlbumsList(
            coverImage: 'image',
            id: 1,
            artist: AlbumArtist(name: 'name', id: 1),
            title: 'title',
            type: 'type',
          )
        ];

        // Act
        final result = await bestAlbumRepository.cacheAlbums(albums);

        // Assert
        expect(result, isNotNull);
        expect(result.length, 1);
        expect(result[0].title, 'title');
      });
    });

    group('getAlbumsFromDb', () {
      test('should return a list of BestAlbum from the database', () async {
        // Arrange
        when(() => audioDatabase.getallBestAlbums())
            .thenAnswer((_) => Future.value([
                  createTestAlbum(),
                ]));

        // Act
        final result = await bestAlbumRepository.getAlbumsFromDb();

        // Assert
        expect(result, isNotNull);
        expect(result.length, 1);
        expect(result[0].image, 'image');
      });
    });

    group('getBestAlbums', () {
      test('should return albums from the database when available', () async {
        // Arrange
        when(() => audioDatabase.getallBestAlbums())
            .thenAnswer((_) => Future.value([
                  createTestAlbum(),
                ]));

        // Act
        final result = await bestAlbumRepository.getBestAlbums(0, 1);

        // Assert
        expect(result, isNotNull);
        expect(result.length, 1);
        expect(result[0].image, 'image');
        verifyNever(() => bestAlbumRepository.fetchAndCacheBestAlbums(0, 1));
      });

      test('should return albums from the service when limit is exceeded',
          () async {
        // Arrange
        when(() => audioDatabase.getallBestAlbums())
            .thenAnswer((_) => Future.value([]));

        when(() => bestAlbumRepository.fetchAndCacheBestAlbums(0, 1))
            .thenAnswer((_) => Future.value([
                  createTestAlbum(),
                  createTestAlbum(),
                ]));

        final albumsResponse = createTestAlbumsResponse();
        final response = createTestResponse(albumsResponse);

        when(() => audioPlayerServiceMock.getBestAlbums(0, 2))
            .thenAnswer((_) => Future.value(response));

        // Act
        final result = await bestAlbumRepository.getBestAlbums(0, 2);

        // Assert
        expect(result, isNotNull);
        expect(result[0].image, 'image');
        expect(result.length, 2);
        verify(() => bestAlbumRepository.fetchAndCacheBestAlbums(0, 2))
            .called(1);
      });
    });
  });
}

// Helper methods to create test data
BestAlbum createTestAlbum() {
  return const BestAlbum(
    artist: 'artist',
    detailAlbum: 1,
    id: 1,
    image: 'image',
    title: 'title',
    type: 'type',
  );
}

BestAlbumsResponse createTestAlbumsResponse() {
  return BestAlbumsResponse(data: [
    BestAlbumsList(
      artist: AlbumArtist(name: 'artist', id: 1),
      coverImage: 'image',
      id: 1,
      title: 'title',
      type: 'album',
    ),
    BestAlbumsList(
      artist: AlbumArtist(name: 'artist', id: 1),
      coverImage: 'image',
      id: 2,
      title: 'title',
      type: 'album',
    ),
  ]);
}

Response<BestAlbumsResponse> createTestResponse(BestAlbumsResponse data) {
  return Response<BestAlbumsResponse>(
    http.Response('response_body', 200),
    data,
  );
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  @override
  Future<void> addManyAlbums(List<BestAlbum> albums) async {
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}
