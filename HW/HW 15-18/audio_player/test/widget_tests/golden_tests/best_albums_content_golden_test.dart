import 'dart:convert';

import 'package:audio_player/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/widgets/ui_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:nock/nock.dart';

import '../home_screen/golden_image.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('BestAlbumsContent widget list', (tester) async {
      await loadAppFonts();
      nock.init();
      nock.cleanAll();
      nock('https://run.mocky.io')
          .get('/v3/image1.jpg')
          .reply(200, base64Decode(imageURL));

      // Build the BestAlbumList widget with the bestAlbumList.
      await tester.pumpWidgetBuilder(
        MaterialApp(
          home: Scaffold(
              backgroundColor: AppColors.background.color,
              body: const BestAlbumsContent(
                  id: 1,
                  image: 'https://run.mocky.io/v3/image1.jpg',
                  artist: 'Fauve',
                  title: 'Blizzard')),
        ),
        wrapper: materialAppWrapper(),
        surfaceSize: const Size(600, 150),
      );

      await screenMatchesGolden(tester, 'bestAlbumsContent widget list');
    });
  });

  testGoldens('BestAlbumsContent widget grid', (tester) async {
    await loadAppFonts();
    nock.init();
    nock.cleanAll();
    nock('https://run.mocky.io')
        .get('/v3/image1.jpg')
        .reply(200, base64Decode(imageURL));

    // Build the BestAlbumList widget with the bestAlbumList.
    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
            backgroundColor: AppColors.background.color,
            body: const BestAlbumsContent(
                id: 1,
                image: 'https://run.mocky.io/v3/image1.jpg',
                artist: 'Fauve',
                title: 'Blizzard')),
      ),
      wrapper: materialAppWrapper(),
      surfaceSize: const Size(220, 220),
    );

    await screenMatchesGolden(tester, 'bestAlbumsContent widget grid');
  });
}
