import 'dart:async';

import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';

import 'package:audio_player/services/service.dart';
import 'package:audio_player/services/services.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final audioDatabase = AudioDatabaseMock();
  final audioPlayerServiceMock = AudioPlayerServiceMock();
  final albumDetailsRepository =
      AlbumDetailsRepository(audioDatabase, audioPlayerServiceMock);

  group('AlbumDetailsRepository', () {
    test('getDetailAlbums should return album from the database', () async {
      // Arrange
      when(() => audioDatabase.watchInfoInDetailAlbum(1))
          .thenAnswer((_) => Stream.value([createTestDetailAlbums()]));

      // Act
      final result = await albumDetailsRepository.getDetailAlbums('1');

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].type, 'album');
      verifyNever(() => audioPlayerServiceMock.getAlbumSongsList('1'));
    });

    test('getDetailAlbums should return album from the API', () async {
      // Arrange
      const albumId = '2';
      final songsListResponse = createTestAlbumDetailResponse();
      final response = createTestResponse(songsListResponse);

      when(() => audioDatabase.watchInfoInDetailAlbum(2))
          .thenAnswer((_) => Stream.value([]));

      when(() => audioPlayerServiceMock.getAlbumSongsList(albumId))
          .thenAnswer((_) => Future.value(response));

      // Act
      final _ = await albumDetailsRepository.getDetailAlbums(albumId);

      // Assert
      verify(() => audioPlayerServiceMock.getAlbumSongsList(albumId)).called(1);
    });
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  @override
  Future<void> addManyDetailAlbums(List<DetailAlbum> albums) async {
    // Return a completed future with a value to simulate a successful operation
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
DetailAlbum createTestDetailAlbums() {
  return const DetailAlbum(
      albumid: 1,
      artistNames: 'name',
      id: 1,
      preview: 'preview',
      title: 'title',
      type: 'album');
}

AlbumDetailsResponse createTestAlbumDetailResponse() {
  return AlbumDetailsResponse(data: [
    AlbumData(
        id: 2,
        title: "title",
        type: "album",
        preview: "preview",
        artist: AlbumDataArtist(name: "name"))
  ]);
}

Response<AlbumDetailsResponse> createTestResponse(AlbumDetailsResponse data) {
  return Response<AlbumDetailsResponse>(
    http.Response('response_body', 200),
    data,
  );
}
