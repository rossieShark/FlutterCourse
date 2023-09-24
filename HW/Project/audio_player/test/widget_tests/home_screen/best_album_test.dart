import 'dart:convert';

import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/home_screen/home_screen_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';

import 'golden_image.dart';

// Import your widget and relevant classes here

void main() {
  testWidgets('BestAlbumList widget test', (WidgetTester tester) async {
    // Define your mock data for testing
    nock.init();
    nock.cleanAll();
    nock('https://run.mocky.io')
        .get('/v3/image1.jpg')
        .reply(200, base64Decode(imageURL));
    const image = 'https://run.mocky.io/v3/image1.jpg';
    final bestAlbumList = [
      const BestAlbum(
        id: 1,
        image: image,
        artist: 'Artist',
        title: 'Title',
        detailAlbum: 1,
        type: 'album',
      ),
      const BestAlbum(
          id: 1,
          image: image,
          artist: 'Artist',
          title: 'Title',
          detailAlbum: 1,
          type: 'album')
    ];

    // Build the BestAlbumList widget with the mock data
    await tester.pumpWidget(
      MaterialApp(
        home: BestAlbumList(bestAlbumList: bestAlbumList),
      ),
    );

    // Verify that the widget is initially displayed
    expect(find.byType(BestAlbumList), findsOneWidget);
  });
}
