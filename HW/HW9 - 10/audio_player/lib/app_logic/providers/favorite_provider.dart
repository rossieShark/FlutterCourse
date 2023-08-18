import 'package:audio_player/models/models.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<SongModel> _favoriteSong = [];
  final List<SongModel> _favoriteAlbum = [];

  List<SongModel> get favoriteSong => _favoriteSong;
  List<SongModel> get favoriteAlbum => _favoriteAlbum;

  void addToFavorites(SongModel detailSong) {
    _favoriteSong.add(detailSong);
    notifyListeners();
  }

  void addToFavoritesAlbum(SongModel detailSong) {
    _favoriteAlbum.add(detailSong);
    notifyListeners();
  }

  void removeFromFavorites(SongModel detailSong) {
    _favoriteSong.removeWhere((item) => item.id == detailSong.id);
    notifyListeners();
  }

  void removeFromFavoritesAlbum(SongModel detailSong) {
    _favoriteAlbum.removeWhere((item) => item.id == detailSong.id);
    notifyListeners();
  }

  bool contains(String songId) {
    return _favoriteSong.any((song) => song.id == songId);
  }

  bool containsAlbum(String songId) {
    return _favoriteAlbum.any((song) => song.id == songId);
  }
}
