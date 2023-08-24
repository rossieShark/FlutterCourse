import 'package:audio_player/databases/database.dart';

import 'package:audio_player/models/models.dart';
import 'package:flutter/material.dart';

class RecentlySearchedProvider extends ChangeNotifier {
  final AudioDatabase _database;
  final List<SongModel> _recentlySearchedList = [];
  RecentlySearchedProvider(this._database);
  List<SongModel> get favoriteSong => _recentlySearchedList;

  Future<void> addToFavorites(SongModel detailSong) async {
    _recentlySearchedList.add(detailSong);
    notifyListeners();
    await _database.insertRecentlySearched(
      RecentlySearchedSong(
          id: int.parse(detailSong.id),
          title: detailSong.title,
          artist: detailSong.artist_names,
          songImage: detailSong.header_image_url),
    );
  }

  Future<void> removeAll() async {
    _recentlySearchedList.clear();
    notifyListeners();
    await _database.clearAll();
  }

  Future<void> loadFavorites() async {
    final recentlySearchedSongs = await _database.getRecentlySearchedSongs();
    final loadedRecentlySearchedSongs = recentlySearchedSongs
        .map(
          (favoriteSong) => SongModel(
            id: favoriteSong.id.toString(),
            title: favoriteSong.title,
            artist_names: favoriteSong.artist,
            header_image_url: favoriteSong.songImage,
          ),
        )
        .toList();
    _recentlySearchedList.clear();
    _recentlySearchedList.addAll(loadedRecentlySearchedSongs);
    notifyListeners();
  }
}
