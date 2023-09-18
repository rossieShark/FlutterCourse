import 'package:audio_player/models/played_song_model.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';

class MusicProvider with ChangeNotifier {
  List<PlayedSong> playlist = [];
  final AudioPlayer audioPlayer = AudioPlayer();

  int _currentSongIndex = 0;
  int _currentSongId = -1;

  int get currentSongIndex => _currentSongIndex;
  int get currentSongId => _currentSongId;
  bool get isPlaying => audioPlayer.state == PlayerState.playing;

  set currentSongId(int songId) {
    _currentSongId = songId;
    notifyListeners();
  }

  void addSong(PlayedSong song) {
    playlist.add(song);
    notifyListeners();
  }

  void addMultipleSongs(List<PlayedSong> songs) {
    playlist.addAll(songs);
    notifyListeners();
  }

  void clearPlaylist() {
    playlist.clear();
    _currentSongId = -1;
    _currentSongIndex = 0;
    notifyListeners();
  }

  void play(String url) async {
    await audioPlayer.play(UrlSource(url));

    notifyListeners();
  }

  void pause() {
    audioPlayer.pause();
    notifyListeners();
  }

  void stop() {
    audioPlayer.stop();

    notifyListeners();
  }

  void musicCompleted() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        audioPlayer.stop();
      }
    });
  }

  void automaticPlay(int i, int length, int id, int nullId) {
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        if (i + 1 < length) {
          i++;
          play(playlist[i].preview);
          currentSongId = id;
          _currentSongIndex = i;
        } else {
          play(playlist[0].preview);
          currentSongId = nullId;
          _currentSongIndex = 0;
        }
      }
    });
  }

  void playNext() {
    if (_currentSongIndex < playlist.length - 1) {
      _currentSongIndex++;
      play(playlist[_currentSongIndex].preview);
    } else {
      _currentSongIndex = 0;
      play(playlist[_currentSongIndex].preview);
    }
  }

  void playPrevious() {
    if (_currentSongIndex > 0) {
      _currentSongIndex--;
      play(playlist[_currentSongIndex].preview);
    } else {
      _currentSongIndex = playlist.length - 1;
      play(playlist[_currentSongIndex].preview);
    }
  }

  bool isSongInPlaylist(int songId) {
    return playlist.any((song) => song.id == songId);
  }

  bool isSongPlaying(int songId) {
    return _currentSongId == songId;
  }

  bool isCurrentlyPlaying(int songId) {
    return _currentSongId == songId;
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
