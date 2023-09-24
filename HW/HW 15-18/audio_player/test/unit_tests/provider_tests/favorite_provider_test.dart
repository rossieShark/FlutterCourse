import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('FavoriteProvider Tests', () {
    late FavoriteProvider provider;
    final database = MockDatabase();

    setUp(() {
      // Create a mock database instance

      provider = FavoriteProvider(database);
    });

    test('addToFavorites should add a song to database and list', () async {
      final song = SongModel(
          artistNames: 'artist',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'song1',
          type: 'track');

      await provider.addToFavorites(song);

      expect(provider.favoriteSong, contains(song));
    });

    test('addToFavoritesAlbum should add a album to database and list',
        () async {
      final album = SongModel(
          artistNames: 'artist',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'album1',
          type: 'album');

      await provider.addToFavoritesAlbum(album);

      expect(provider.favoriteAlbum, contains(album));
    });

    test('isFavoriteSong should return yes ', () async {
      final song = SongModel(
          artistNames: 'artist',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'song1',
          type: 'track');
      provider.addToFavorites(song);

      final exists1 = provider.isFavoriteSong('1');
      final exists2 =
          provider.isFavoriteSong('2'); // A folder that doesn't exist
      expect(exists1, true); // Expect it to return true for an existing folder
      expect(exists2, false);
    });

    test('isFavoriteAlbum should return yes or no ', () async {
      final album = SongModel(
          artistNames: 'artist',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'album1',
          type: 'album');
      provider.addToFavoritesAlbum(album);

      final exists1 = provider.isFavoriteAlbum('1');
      final exists2 =
          provider.isFavoriteAlbum('2'); // A folder that doesn't exist
      expect(exists1, true); // Expect it to return true for an existing folder
      expect(exists2, false);
    });

    test('removeFromFavorites should remove from list and database ', () async {
      final song = SongModel(
          artistNames: 'artist',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'song1',
          type: 'track');
      await provider.addToFavorites(song);
      expect(provider.favoriteSong, contains(song));
      await provider.removeFromFavorites(song);
      expect(provider.isFavoriteSong('1'), false);
    });

    test('removeFromFavoritesAlbum should remove album from list and database ',
        () async {
      final album = SongModel(
          artistNames: 'artist',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'album1',
          type: 'album');
      await provider.addToFavoritesAlbum(album);
      expect(provider.favoriteAlbum, contains(album));
      await provider.removeFromFavoritesAlbum(album);
      expect(provider.isFavoriteAlbum('1'), false);
    });

    test('toggleSortSong should sort songs alphabetically', () {
      // Arrange
      final song1 = SongModel(
          artistNames: 'B',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'song1',
          type: 'track');
      final song2 = SongModel(
          artistNames: 'C',
          id: '2',
          image: 'image',
          preview: 'preview',
          title: 'song2',
          type: 'track');
      final song3 = SongModel(
          artistNames: 'A',
          id: '3',
          image: 'image',
          preview: 'preview',
          title: 'song3',
          type: 'track');
      // Create an instance of your class
      provider.addToFavorites(song1);
      provider.addToFavorites(song2);
      provider.addToFavorites(song3);

      // Act
      provider.toggleSortSong();

      // Assert
      expect(provider.favoriteSong[0].artistNames, 'A');
      expect(provider.favoriteSong[1].artistNames, 'B');
      expect(provider.favoriteSong[2].artistNames, 'C');
    });

    test('sortFavoriteSongsAlphabeticallyReverse should reverse sort songs',
        () {
      // Arrange
      final song1 = SongModel(
          artistNames: 'B',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'song1',
          type: 'track');
      final song2 = SongModel(
          artistNames: 'C',
          id: '2',
          image: 'image',
          preview: 'preview',
          title: 'song2',
          type: 'track');
      final song3 = SongModel(
          artistNames: 'A',
          id: '3',
          image: 'image',
          preview: 'preview',
          title: 'song3',
          type: 'track');
      // Create an instance of your class
      provider.addToFavorites(song1);
      provider.addToFavorites(song2);
      provider.addToFavorites(song3);
      // Act
      provider.sortFavoriteSongsAlphabeticallyReverse();

      // Assert
      expect(provider.favoriteSong[0].artistNames, 'C');
      expect(provider.favoriteSong[1].artistNames, 'B');
      expect(provider.favoriteSong[2].artistNames, 'A');
    });
    test('toggleSortAlbum should sort albums alphabetically', () {
      // Arrange
      final album1 = SongModel(
          artistNames: 'B',
          id: '1',
          image: 'image',
          preview: 'preview',
          title: 'album1',
          type: 'album');
      final album2 = SongModel(
          artistNames: 'C',
          id: '2',
          image: 'image',
          preview: 'preview',
          title: 'album2',
          type: 'album');
      final album3 = SongModel(
          artistNames: 'A',
          id: '3',
          image: 'image',
          preview: 'preview',
          title: 'album3',
          type: 'album');
      // Create an instance of your class
      provider.addToFavoritesAlbum(album1);
      provider.addToFavoritesAlbum(album2);
      provider.addToFavoritesAlbum(album3);

      // Act
      provider.toggleSortAlbum();

      // Assert
      expect(provider.favoriteAlbum[0].artistNames, 'A');
      expect(provider.favoriteAlbum[1].artistNames, 'B');
      expect(provider.favoriteAlbum[2].artistNames, 'C');
    });

    test('loadRecentlySearched should load data from the database', () async {
      // Create a mock database instance

      // Define a list of RecentlySearchedSong objects to return from the mock database
      final mockDatabaseData = [
        const FavoriteSong(
          preview: 'preview_url_1',
          type: 'track',
          id: 1,
          title: 'Song Title 1',
          artist: 'Artist Name 1',
          songImage: 'image_url_1',
        ),
        const FavoriteSong(
          preview: 'preview_url_2',
          type: 'track',
          id: 2,
          title: 'Song Title 2',
          artist: 'Artist Name 2',
          songImage: 'image_url_2',
        ),
      ];

      final mockDatabaseDataAlbum = [
        const FavoriteAlbum(
          preview: 'preview_url_1',
          type: 'track',
          id: 1,
          title: 'Song Title 1',
          artist: 'Artist Name 1',
          songImage: 'image_url_1',
        ),
        const FavoriteAlbum(
          preview: 'preview_url_2',
          type: 'track',
          id: 2,
          title: 'Song Title 2',
          artist: 'Artist Name 2',
          songImage: 'image_url_2',
        ),
      ];

      // Set up the behavior of the mock database to return the defined data
      when(() => database.getFavoriteSongs())
          .thenAnswer((_) async => mockDatabaseData);
      when(() => database.getFavoriteAlbums())
          .thenAnswer((_) async => mockDatabaseDataAlbum);
      // Call the method to be tested
      await provider.loadFavorites();

      // Verify that the data is correctly loaded into the provider's list
      expect(provider.favoriteSong.length, mockDatabaseData.length);
      expect(provider.favoriteAlbum.length, mockDatabaseDataAlbum.length);
      expect(provider.favoriteSong[0].preview, 'preview_url_1');
      expect(provider.favoriteAlbum[1].preview, 'preview_url_2');

      // You can add more assertions as needed to verify other properties of the loaded data
    });
  });
}

class MockDatabase extends Mock implements AudioAppDatabase {
  @override
  Future<void> insertFavoriteSong(FavoriteSong song) async {
    return Future<void>.value();
  }

  @override
  Future<void> deleteFavoriteSong(int id) async {
    return Future<void>.value();
  }

  @override
  Future<void> insertFavoritAlbum(FavoriteAlbum album) async {
    return Future<void>.value();
  }

  @override
  Future<void> deleteFavoriteAlbum(int id) async {
    return Future<void>.value();
  }
}
