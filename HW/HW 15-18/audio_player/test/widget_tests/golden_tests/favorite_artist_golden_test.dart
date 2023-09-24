import 'dart:convert';

import 'package:audio_player/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:nock/nock.dart';

import '../home_screen/golden_image.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('FavoriteListContent widget medium', (tester) async {
      await loadAppFonts();
      nock.init();
      nock.cleanAll();
      nock('https://run.mocky.io')
          .get('/v3/image1.jpg')
          .reply(200, base64Decode(imageURL));

      // Build the FavoriteListContent widget with the bestAlbumList.
      await tester.pumpWidgetBuilder(
        MaterialApp(
          home: Scaffold(
            backgroundColor: AppColors.background.color,
            body: const FavoriteListContent(
              image: 'https://run.mocky.io/v3/image1.jpg',
              name: 'Fauve',
            ),
          ),
        ),
        wrapper: materialAppWrapper(),
        surfaceSize: const Size(115, 115),
      );

      await screenMatchesGolden(tester, 'favoriteListContent golden medium');
    });
  });
}
