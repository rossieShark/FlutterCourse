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
  final songDetailRepository =
      SongDetailRepository(audioDatabase, audioPlayerServiceMock);

  group('AlbumDetailsRepository', () {
    test('getDetailAlbums should return album from the database', () async {
      // Arrange
      when(() => audioDatabase.watchDetailSongById(1))
          .thenAnswer((_) => Stream.value(createTestDetailSong()));

      // Act
      final result = await songDetailRepository.getDetailSongInfo('1');

      // Assert
      expect(result, isNotNull);

      expect(result!.type, 'track');
      verifyNever(() => audioPlayerServiceMock.getDetailSongs('1'));
    });

    test('getDetailAlbums should return album from the API', () async {
      // Arrange
      final songsResponse = createTestAlbumDetailResponse();
      final response = createTestResponse(songsResponse);

      // Mock the scenario where the data is not found in the local database
      when(() => audioDatabase.watchDetailSongById(2))
          .thenAnswer((_) => Stream.value(null));

      // Mock the API service to return the response
      when(() => audioPlayerServiceMock.getDetailSongs('2'))
          .thenAnswer((_) => Future.value(response));

      // Act
      final result = await songDetailRepository.getDetailSongInfo('2');

      // Assert
      // Check that the result is not null and the type is 'track'
      expect(result, isNotNull);
      expect(result!.type, 'track');

      // Verify that the API service was called once with the correct parameter
      verify(() => audioPlayerServiceMock.getDetailSongs('2')).called(1);

      // Verify that the database's insertDetailSong method was called once with the correct arguments
      //  verify(() => audioDatabase.insertDetailSong(any())).called(1);
    });
    test('getDetailAlbums should return null from the API', () async {
      // Arrange
      final response = createTestErrorResponse();
      // Mock the scenario where the data is not found in the local database
      when(() => audioDatabase.watchDetailSongById(2))
          .thenAnswer((_) => Stream.value(null));

      // Mock the API service to return a non-successful response (e.g., status code 404)
      when(() => audioPlayerServiceMock.getDetailSongs('2'))
          .thenAnswer((_) => Future.value(response));

      // Act
      final result = await songDetailRepository.getDetailSongInfo('2');

      // Assert
      // Check that the result is null since the API request was not successful
      expect(result, isNull);

      // Verify that the API service was called once with the correct parameter
      verify(() => audioPlayerServiceMock.getDetailSongs('2')).called(1);
    });
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  @override
  Future<void> insertDetailSong(DetailInfoSong detailInfoSong) async {
    // Return a completed future with a value to simulate a successful operation
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
DetailInfoSong createTestDetailSong() {
  return const DetailInfoSong(
      artistNames: 'name',
      id: 1,
      imageUrl: 'image',
      preview: 'preview',
      title: 'title',
      type: 'track');
}

SongDetailsResponce createTestAlbumDetailResponse() {
  return SongDetailsResponce(
      contributors: [Artist(image: 'image', name: 'name')],
      preview: 'preview',
      title: 'title',
      type: 'track');
}

Response<SongDetailsResponce> createTestResponse(SongDetailsResponce data) {
  return Response<SongDetailsResponce>(
    http.Response('response_body', 200),
    data,
  );
}

Response<SongDetailsResponce> createTestErrorResponse() {
  return Response<SongDetailsResponce>(
      http.Response('response_body', 404), null);
}
