import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:audio_player/models/played_song_model.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('MusicProvider Tests', () {
    WidgetsFlutterBinding.ensureInitialized();
    late MusicProvider musicProvider;
    final mockAudioPlayer = MockAudioPlayer();
    setUp(() {
      // Create a new instance of the MusicProvider for each test

      musicProvider = MusicProvider(mockAudioPlayer);
    });

    test('Add song to playlist', () {
      final song = PlayedSong(
        id: 1,
        preview: 'song_url',
        // Initialize other properties as needed
      );

      musicProvider.addSong(song);

      // Assert that the song is added to the playlist
      expect(musicProvider.playlist.contains(song), isTrue);
    });

    test('  addMultipleSongs', () {
      final songs = [
        PlayedSong(id: 1, preview: 'song_url'),
        PlayedSong(id: 1, preview: 'song_url')
      ];
      // Initialize other properties as needed

      musicProvider.addMultipleSongs(songs);

      // Assert that the current song is set correctly
      expect(musicProvider.playlist.length, 2);
    });
    test('  clearPlaylist', () {
      final songs = [
        PlayedSong(id: 1, preview: 'song_url'),
        PlayedSong(id: 1, preview: 'song_url')
      ];
      // Initialize other properties as needed

      musicProvider.addMultipleSongs(songs);

      // Assert that the current song is set correctly
      expect(musicProvider.playlist.length, 2);

      musicProvider.clearPlaylist();
      expect(musicProvider.playlist.length, 0);
      expect(musicProvider.currentSongId, -1);
      expect(musicProvider.currentSongIndex, 0);
    });

    test('isSongInPlaylist ', () async {
      final songs = [
        PlayedSong(id: 1, preview: 'song_url'),
      ];
      // Initialize other properties as needed

      musicProvider.addMultipleSongs(songs);

      final result1 = musicProvider.isSongInPlaylist(songs[0].id);
      final result2 = musicProvider.isSongInPlaylist(4);
      expect(result1, true);
      expect(result2, false);
    });
    test('isCurrentlyPlaying ', () async {
      final songs = [
        PlayedSong(id: 1, preview: 'song_url'),
      ];
      // Initialize other properties as needed

      musicProvider.addMultipleSongs(songs);
      musicProvider.currentSongId = 1;
      final result1 = musicProvider.isCurrentlyPlaying(songs[0].id);
      final result2 = musicProvider.isCurrentlyPlaying(4);
      expect(result1, true);
      expect(result2, false);
    });
  });
}

class MockAudioPlayer extends Mock implements AudioPlayer {}
