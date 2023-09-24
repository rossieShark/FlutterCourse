import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/favorite_folder_model.dart';
import 'package:flutter/material.dart';

class MyMusicFoldersProvider extends ChangeNotifier {
  final AudioAppDatabase _database;
  final List<FavoriteFolder> _folders = [];
  List<FavoriteFolder> get folders => _folders;
  MyMusicFoldersProvider(this._database);

  Future<void> addToFolders(FavoriteFolder folder) async {
    _folders.add(folder);
    notifyListeners();
    await _database.insertToMyFolders(
      MyMusicFolder(
        name: folder.title,
        image: folder.image,
      ),
    );
  }

  bool doesFolderExist(String folderTitle) {
    return _folders.any((folder) => folder.title == folderTitle);
  }

  Future<void> loadFolders() async {
    final folders = await _database.getFolders();
    final loadedFolders = folders
        .map(
          (folder) => FavoriteFolder(
            title: folder.name,
            image: folder.image,
          ),
        )
        .toList();
    _folders.clear();
    _folders.addAll(loadedFolders);
    notifyListeners();
  }
}
