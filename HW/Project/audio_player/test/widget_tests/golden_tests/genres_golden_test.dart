import 'dart:convert';
import 'package:audio_player/screens/search_screen/bloc_empty_state/web/genres_section/create_genres_section.dart';
import 'package:audio_player/widgets/ui_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:nock/nock.dart';

import '../home_screen/golden_image.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('CreateGenresListContent widget list', (tester) async {
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
              body: const CreateGenresListContent(
                image: 'https://run.mocky.io/v3/image1.jpg',
                name: 'Pop',
                isHovered: false,
              )),
        ),
        wrapper: materialAppWrapper(),
        surfaceSize: const Size(300, 300),
      );

      await screenMatchesGolden(tester, 'createGenresListContent widget list');
    });
  });
}
