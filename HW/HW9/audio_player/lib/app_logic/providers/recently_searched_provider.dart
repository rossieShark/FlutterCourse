import 'package:audio_player/models/models.dart';
import 'package:flutter/material.dart';

class RecentlySearchedProvider extends ChangeNotifier {
  final List<SongModel> _recentlySearchedList = [];

  List<SongModel> get favoriteSong => _recentlySearchedList;

  void addToFavorites(SongModel detailSong) {
    _recentlySearchedList.add(detailSong);
    notifyListeners();
  }

  void removeAll() {
    _recentlySearchedList.clear();
    notifyListeners();
  }
}
