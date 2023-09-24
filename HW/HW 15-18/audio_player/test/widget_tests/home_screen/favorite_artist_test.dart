import 'dart:convert';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/home_screen/home_screen_index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nock/nock.dart';

import 'golden_image.dart';

void main() {
  group('FavoriteArtistList Widget Test', () {
    final mockFavoriteArtistBloc = MockFavoriteArtistBloc();

    testWidgets('Renders loading indicator when list is empty', (tester) async {
      when(() => mockFavoriteArtistBloc.state)
          .thenReturn(FavoriteArtistState([]));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteArtistBloc>(
            create: (context) => mockFavoriteArtistBloc,
            child: const FavoriteArtistList(),
          ),
        ),
      );

      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
    });

    testWidgets('Renders CreateListView when list is not empty',
        (tester) async {
      nock.init();
      nock.cleanAll();
      nock('https://run.mocky.io')
          .get('/v3/image1.jpg')
          .reply(200, base64Decode(imageURL));
      const image = 'https://run.mocky.io/v3/image1.jpg';
      // Mock the dependencies and initialize the widget
      final favoriteArtistList = [
        const FavoriteArtist(image: image, name: 'Artist 1', id: 1),
        const FavoriteArtist(image: image, name: 'Artist 2', id: 2),
      ];

      final mockFavoriteArtistBloc = MockFavoriteArtistBloc();

      when(() => mockFavoriteArtistBloc.state).thenReturn(
        FavoriteArtistState(favoriteArtistList),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<FavoriteArtistBloc>.value(
            value: mockFavoriteArtistBloc,
            child: const FavoriteArtistList(),
          ),
        ),
      );

      expect(find.byType(CreateListView), findsOneWidget);
    });
  });

  group('CreateListView Widget Test', () {
    nock.init();
    nock.cleanAll();
    nock('https://run.mocky.io')
        .get('/v3/image1.jpg')
        .reply(200, base64Decode(imageURL));
    const image = 'https://run.mocky.io/v3/image1.jpg';
    // Mock the dependencies and initialize the widget
    final favoriteArtistList = [
      const FavoriteArtist(image: image, name: 'Artist 1', id: 1),
      const FavoriteArtist(image: image, name: 'Artist 2', id: 2),
    ];

    final mockFavoriteArtistBloc = MockFavoriteArtistBloc();

    when(() => mockFavoriteArtistBloc.state).thenReturn(
      FavoriteArtistState(favoriteArtistList),
    );

    testWidgets('Renders favorite artists in a horizontal list',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CreateListView(favoriteArtistList: favoriteArtistList),
        ),
      );

      // You can make assertions about the rendered widgets here
      expect(find.byType(FavoriteListContent),
          findsNWidgets(favoriteArtistList.length));
    });

    testWidgets('Renders scroll buttons when list is scrollable',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CreateListView(favoriteArtistList: favoriteArtistList),
        ),
      );

      // You can make assertions about the rendered scroll buttons here
      expect(find.byType(CreateScrollButtons), findsOneWidget);
    });
  });
}

class MockFavoriteArtistBloc
    extends MockBloc<FavoriteArtistEvent, FavoriteArtistState>
    implements FavoriteArtistBloc {}
