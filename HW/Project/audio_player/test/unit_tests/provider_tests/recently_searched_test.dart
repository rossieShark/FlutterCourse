import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('RecentlySearchedProvider Tests', () {
    late RecentlySearchedProvider provider;
    final database = MockDatabase();

    setUp(() {
      // Create a mock database instance

      provider = RecentlySearchedProvider(database);
    });

    test('addToFavorites should add a song to recently searched', () async {
      final song = SongModel(
        preview: 'preview_url',
        type: 'track',
        id: '1',
        title: 'Song Title',
        artistNames: 'Artist Name',
        image: 'image_url',
      );

      await provider.addToFavorites(song);

      expect(provider.recentlySearchedList, contains(song));
    });

    test('removeFromFavorites should remove a song from recently searched',
        () async {
      final song = SongModel(
        preview: 'preview_url',
        type: 'track',
        id: '1',
        title: 'Song Title',
        artistNames: 'Artist Name',
        image: 'image_url',
      );

      await provider.addToFavorites(song);

      expect(provider.recentlySearchedList, contains(song));

      await provider.removeFromFavorites(song);

      expect(provider.recentlySearchedList, isNot(contains(song)));
    });

    test('removeAll should clear all recently searched songs', () async {
      final song1 = SongModel(
        preview: 'preview_url',
        type: 'track',
        id: '1',
        title: 'Song Title 1',
        artistNames: 'Artist Name 1',
        image: 'image_url_1',
      );
      final song2 = SongModel(
        preview: 'preview_url',
        type: 'track',
        id: '2',
        title: 'Song Title 2',
        artistNames: 'Artist Name 2',
        image: 'image_url_2',
      );

      await provider.addToFavorites(song1);
      await provider.addToFavorites(song2);

      expect(provider.recentlySearchedList, contains(song1));
      expect(provider.recentlySearchedList, contains(song2));

      await provider.removeAll();

      expect(provider.recentlySearchedList, isEmpty);
    });
    test('loadRecentlySearched should load data from the database', () async {
      // Create a mock database instance

      // Define a list of RecentlySearchedSong objects to return from the mock database
      final mockDatabaseData = [
        const RecentlySearchedSong(
          preview: 'preview_url_1',
          type: 'track',
          id: 1,
          title: 'Song Title 1',
          artist: 'Artist Name 1',
          songImage: 'image_url_1',
        ),
        const RecentlySearchedSong(
          preview: 'preview_url_2',
          type: 'track',
          id: 2,
          title: 'Song Title 2',
          artist: 'Artist Name 2',
          songImage: 'image_url_2',
        ),
      ];

      // Set up the behavior of the mock database to return the defined data
      when(() => database.getRecentlySearchedSongs())
          .thenAnswer((_) async => mockDatabaseData);

      // Call the method to be tested
      await provider.loadRecentlySearched();

      // Verify that the data is correctly loaded into the provider's list
      expect(provider.recentlySearchedList.length, mockDatabaseData.length);
      expect(provider.recentlySearchedList[0].preview, 'preview_url_1');
      expect(provider.recentlySearchedList[1].preview, 'preview_url_2');

      // You can add more assertions as needed to verify other properties of the loaded data
    });
    // Add more tests for other methods as needed
  });
}

// Create a mock database class for testing purposes
class MockDatabase extends Mock implements AudioAppDatabase {
  @override
  Future<void> insertRecentlySearched(RecentlySearchedSong song) async {
    return Future<void>.value();
  }

  @override
  Future<void> deleteFavoriteSong(int id) async {
    return Future<void>.value();
  }

  @override
  Future<void> clearAll() async {
    return Future<void>.value();
  }
}
