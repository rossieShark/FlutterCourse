import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('MyMusicFoldersProvider Tests', () {
    late MyMusicFoldersProvider provider;
    final database = MockDatabase();

    setUp(() {
      // Create a mock database instance

      provider = MyMusicFoldersProvider(database);
    });

    test('addToFolders should add a folder to database and folders', () async {
      final folder = FavoriteFolder(
        title: 'Folder 1',
        image: 'image_url',
      );

      await provider.addToFolders(folder);

      expect(provider.folders, contains(folder));
    });

    test('doesFolderExist should return yes ', () async {
      final folder = FavoriteFolder(
        title: 'Folder 1',
        image: 'image_url',
      );
      provider.addToFolders(folder);

      final exists1 = provider.doesFolderExist('Folder 1');
      final exists2 = provider
          .doesFolderExist('Song Title1'); // A folder that doesn't exist
      expect(exists1, true); // Expect it to return true for an existing folder
      expect(exists2, false);
    });
    test('loadFolders should load folders from the database', () async {
      // Create a mock database instance

      // Define a list of RecentlySearchedSong objects to return from the mock database
      final mockDatabaseData = [
        const MyMusicFolder(name: 'Folder 1', image: 'image_url'),
        const MyMusicFolder(name: 'Folder 2', image: 'image_url'),
      ];

      // Set up the behavior of the mock database to return the defined data
      when(() => database.getFolders())
          .thenAnswer((_) async => mockDatabaseData);

      // Call the method to be tested
      await provider.loadFolders();

      // Verify that the data is correctly loaded into the provider's list
      expect(provider.folders.length, mockDatabaseData.length);
      expect(provider.folders[0].title, 'Folder 1');
      expect(provider.folders[1].title, 'Folder 2');

      // You can add more assertions as needed to verify other properties of the loaded data
    });
  });
}

class MockDatabase extends Mock implements AudioAppDatabase {
  @override
  Future<void> insertToMyFolders(MyMusicFolder folder) async {
    return Future<void>.value();
  }
}
