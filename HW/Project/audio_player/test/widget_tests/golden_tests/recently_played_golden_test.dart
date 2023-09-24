import 'dart:convert';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nock/nock.dart';

import '../home_screen/golden_image.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('RecentlyPlayedPageContent widget medium', (tester) async {
      await loadAppFonts();
      nock.init();
      nock.cleanAll();
      nock('https://run.mocky.io')
          .get('/v3/image1.jpg')
          .reply(200, base64Decode(imageURL));
      final mockMusicProvider = MockMusicProvider();
      when(() => mockMusicProvider.isPlaying).thenAnswer((invocation) => false);
      // Build the FavoriteListContent widget with the bestAlbumList.
      await tester.pumpWidgetBuilder(
        ChangeNotifierProvider<MusicProvider>(
          create: (context) => mockMusicProvider,
          child: MaterialApp(
            home: Scaffold(
              backgroundColor: AppColors.background.color,
              body: const RecentlyPlayedPageContent(
                image: 'https://run.mocky.io/v3/image1.jpg',
                artistName: 'Fauve',
                title: 'Kane',
                preview: '',
                id: 1,
                isHovered: false,
              ),
            ),
          ),
        ),
        wrapper: materialAppWrapper(),
        surfaceSize: const Size(250, 250),
      );

      await screenMatchesGolden(
          tester, 'recentlyPlayedPageContent golden medium');
    });
  });
}

class MockMusicProvider extends Mock implements MusicProvider {
  @override
  bool get isPlaying;
}
