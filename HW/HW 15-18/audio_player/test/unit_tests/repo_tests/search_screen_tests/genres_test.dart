import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/genres_model/genres_model.dart';
import 'package:audio_player/services/genres_service/genres_service.dart';

import 'package:audio_player/services/service.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final audioDatabase = AudioDatabaseMock();
  final audioPlayerServiceMock = AudioPlayerServiceMock();
  final genresRepository =
      GenresRepository(audioDatabase, audioPlayerServiceMock);

  group('GenresRepository.casheTracks', () {
    test('Should cache genres in the database', () async {
      //arrange
      final tracks = [
        Data(
          id: 1,
          image: 'image',
          name: 'name',
        )
      ];
      //act
      final result = await genresRepository.cacheTracks(tracks);

      //assert
      expect(result, isNotNull);
      expect(result.length, 1);
    });
  });

  group('getAllGenres', () {
    test('should return a list of MusicGenre from the database', () async {
      // Arrange

      when(() => audioDatabase.getallGenres())
          .thenAnswer((_) => Future.value([createTestGenres()]));

      // Act
      final result = await genresRepository.getAllGenres();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].name, 'pop');
      verifyNever(() => audioPlayerServiceMock.getGenres());
    });
  });

  test('Should return genres from the Api ', () async {
    //arrange
    when(() => audioDatabase.getallGenres())
        .thenAnswer((_) => Future.value([]));

    final tracksResponse = createTestGenresResponse();
    final response = createTestResponse(tracksResponse);

    when(() => audioPlayerServiceMock.getGenres())
        .thenAnswer((_) => Future.value(response));
    //act
    final result = await genresRepository.getAllGenres();
    print(result);
    //assert
    expect(result, isNotNull);
    expect(result.length, 1);
    expect(result[0].name, 'rock');
    verify(() => audioPlayerServiceMock.getGenres());
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  @override
  Future<void> addManyGenres(List<MusicGenre> genres) async {
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data
MusicGenre createTestGenres() {
  return const MusicGenre(id: '1', image: 'image', name: 'pop');
}

GenresResponse createTestGenresResponse() {
  return GenresResponse(data: [Data(id: 1, image: 'image', name: 'rock')]);
}

Response<GenresResponse> createTestResponse(GenresResponse data) {
  return Response<GenresResponse>(
    http.Response('response_body', 200),
    data,
  );
}
