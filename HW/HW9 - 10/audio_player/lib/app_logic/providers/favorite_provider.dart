import 'package:audio_player/databases/database.dart';

import 'package:audio_player/models/models.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final AudioDatabase _database;
  final List<SongModel> _favoriteSong = [];
  final List<SongModel> _favoriteAlbum = [];
  FavoriteProvider(this._database);
  List<SongModel> get favoriteSong => _favoriteSong;
  List<SongModel> get favoriteAlbum => _favoriteAlbum;

  bool contains(String songId) {
    return _favoriteSong.any((song) => song.id == songId);
  }

  bool containsAlbum(String songId) {
    return _favoriteAlbum.any((song) => song.id == songId);
  }

  Future<void> addToFavorites(SongModel detailSong) async {
    _favoriteSong.add(detailSong);
    notifyListeners();
    await _database.insertFavoriteSong(
      FavoriteSong(
          id: int.parse(detailSong.id),
          title: detailSong.title,
          artist: detailSong.artist_names,
          songImage: detailSong.header_image_url),
    );
  }

  Future<void> removeFromFavorites(SongModel detailSong) async {
    _favoriteSong.removeWhere((item) => item.id == detailSong.id);
    notifyListeners();
    await _database.deleteFavoriteSong(int.parse(detailSong.id));
  }

  bool _isSorted = false; // Initial sorting state

  bool get isSorted => _isSorted;

  void toggleSortSong() {
    _isSorted = !_isSorted;
    if (_isSorted) {
      _favoriteSong.sort((a, b) => a.artist_names.compareTo(b.artist_names));
    } else {
      // Restore the original order, assuming you have an unsortedOriginalList
      _favoriteSong.clear();
      loadFavorites();
    }
    notifyListeners();
  }

  void toggleSortAlbum() {
    _isSorted = !_isSorted;
    if (_isSorted) {
      _favoriteAlbum.sort((a, b) => a.artist_names.compareTo(b.artist_names));
    } else {
      // Restore the original order, assuming you have an unsortedOriginalList
      _favoriteAlbum.clear();
      loadFavorites();
    }
    notifyListeners();
  }

  void sortFavoriteSongsAlphabeticallyReverse() {
    _favoriteSong.sort((a, b) => b.artist_names.compareTo(a.artist_names));
    notifyListeners();
  }

  Future<void> addToFavoritesAlbum(SongModel detailSong) async {
    _favoriteAlbum.add(detailSong);
    notifyListeners();
    await _database.insertFavoritAlbum(
      FavoriteAlbum(
          id: int.parse(detailSong.id),
          title: detailSong.title,
          artist: detailSong.artist_names,
          songImage: detailSong.header_image_url),
    );
  }

  Future<void> removeFromFavoritesAlbum(SongModel detailSong) async {
    _favoriteAlbum.removeWhere((item) => item.id == detailSong.id);
    notifyListeners();
    await _database.deleteFavoriteAlbum(int.parse(detailSong.id));
  }

  Future<void> loadFavorites() async {
    final favoriteSongs = await _database.getFavoriteSongs();
    final loadedFavoriteSongs = favoriteSongs
        .map(
          (favoriteSong) => SongModel(
            id: favoriteSong.id.toString(),
            title: favoriteSong.title,
            artist_names: favoriteSong.artist,
            header_image_url: favoriteSong.songImage,
          ),
        )
        .toList();
    _favoriteSong.clear();
    _favoriteSong.addAll(loadedFavoriteSongs);
    notifyListeners();
    final favoriteAlbums = await _database.getFavoriteAlbums();
    final loadedFavoriteAlbums = favoriteAlbums
        .map(
          (favoriteAlbum) => SongModel(
            id: favoriteAlbum.id.toString(),
            title: favoriteAlbum.title,
            artist_names: favoriteAlbum.artist,
            header_image_url: favoriteAlbum.songImage,
          ),
        )
        .toList();
    _favoriteAlbum.clear();
    _favoriteAlbum.addAll(loadedFavoriteAlbums);

    notifyListeners();
  }
}
