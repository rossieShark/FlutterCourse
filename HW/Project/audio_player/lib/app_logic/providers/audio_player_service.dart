import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicProvider with ChangeNotifier {
  List<String> playlist = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  int _currentSongIndex = 0;

  bool get isPlaying => _isPlaying;
  int get currentSongIndex => _currentSongIndex;

  void addSong(String song) {
    playlist.add(song);
    notifyListeners();
  }

  void addMultipleSongs(List<String> songs) {
    playlist.addAll(songs);
    notifyListeners();
  }

  void clearPlaylist() {
    playlist.clear();
    _currentSongIndex = 0;
    notifyListeners();
  }

  void play(String url) async {
    await _audioPlayer.play(UrlSource(url));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void stop() {
    _audioPlayer.stop();
    _isPlaying = false;
    notifyListeners();
  }

  void playNext() {
    if (_currentSongIndex < playlist.length - 1) {
      _currentSongIndex++;
      play(playlist[_currentSongIndex]);
    }
  }

  void playPrevious() {
    if (_currentSongIndex > 0) {
      _currentSongIndex--;
      play(playlist[_currentSongIndex]);
    }
  }

  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
