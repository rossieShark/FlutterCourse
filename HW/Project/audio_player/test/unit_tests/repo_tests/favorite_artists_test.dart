import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/services/home_screen_service/home_service.dart';
import 'package:audio_player/services/service.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final audioDatabase = AudioDatabaseMock();
  final audioPlayerServiceMock = AudioPlayerServiceMock();
  final favoriteArtistRepository = FavoriteArtistRepository(
    audioDatabase,
  );

  group('FavoriteArtistRepository.casheTracks', () {
    test('Should cache artists in the database', () async {
      //arrange
      final tracks = [Artists(id: 1, image: 'image', name: 'name')];

      //act
      final result = await favoriteArtistRepository.cacheTracks(tracks);

      //assert
      expect(result, isNotNull);
    });
  });

  group('getTracksFromDb', () {
    test('should return a list of FavoriteArtist from the database', () async {
      // Arrange
      when(audioDatabase.getallFavouriteArtists())
          .thenAnswer((_) => Future.value([
                FavoriteArtist(name: 'Artist1', id: 1, image: 'image'),
                FavoriteArtist(name: 'Artist2', id: 2, image: 'image'),
              ]));

      // Act
      final result = await favoriteArtistRepository.getTracksFromDb();

      // Assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0].name, 'Artist1');
      expect(result[1].name, 'Artist2');
    });
  });

  group('FavoriteArtistRepository.getFavoriteArtists', () {
    test('Should return artists from the database when available', () async {
      //arrange
      final favoritesFromDb = await audioDatabase.getallFavouriteArtists();

      //act
      final result = await favoriteArtistRepository.getFavoriteArtists();
      //assert
      expect(result, isNotNull);
      expect(result.length, 2);
      expect(result[0].name, 'Artist1');
      expect(result[1].name, 'Artist2');

      verifyNever(audioPlayerServiceMock.getFavoriteArtists());
    });
  });
}

class AudioDatabaseMock extends Mock implements AudioAppDatabase {
  Future<void> addManyFavoriteArtists(List<FavoriteArtist> artists) async {
    return Future<void>.value();
  }
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}
