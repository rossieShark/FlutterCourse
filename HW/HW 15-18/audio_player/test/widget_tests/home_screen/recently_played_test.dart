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

// Import your blocs and relevant classes here

void main() {
  group('FavoriteArtistList Widget Test', () {
    final mockRecentlyPlayedBloc = MockRecentlyPlayedBloc();
    final mockMusicProvider = MockMusicProvider();

    testWidgets('Renders loading indicator when list is empty', (tester) async {
      when(() => mockRecentlyPlayedBloc.state)
          .thenReturn(RecentlyPlayedBlocState([]));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<RecentlyPlayedBloc>(
            create: (context) => mockRecentlyPlayedBloc,
            child: ChangeNotifierProvider<MusicProvider>(
                create: (context) => mockMusicProvider,
                child: const RecentlyPlayedList()),
          ),
        ),
      );

      expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
    });

    testWidgets('RecentlyPlayedList widget test', (WidgetTester tester) async {
      nock.init();
      nock.cleanAll();
      nock('https://run.mocky.io')
          .get('/v3/image1.jpg')
          .reply(200, base64Decode(imageURL));
      const image = 'https://run.mocky.io/v3/image1.jpg';

      when(() => mockRecentlyPlayedBloc.state)
          .thenReturn(RecentlyPlayedBlocState(createTestItems(image)));
      // Define the initial state of the bloc

      when(() => mockMusicProvider.isPlaying).thenAnswer((invocation) => false);
      // Build the RecentlyPlayedList widget with the mock bloc
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<RecentlyPlayedBloc>(
            create: (context) => mockRecentlyPlayedBloc,
            child: ChangeNotifierProvider<MusicProvider>(
                create: (context) => mockMusicProvider,
                child: const RecentlyPlayedList()),
          ),
        ),
      );

      // Verify that the widget displays the data (e.g., check for items in the list)
      expect(find.byType(RecentlyPlayedPageContent),
          findsNWidgets(createTestItems(image).length * 2));
    });
    testWidgets('ImageListView widget test', (WidgetTester tester) async {
      nock.init();
      nock.cleanAll();
      nock('https://run.mocky.io')
          .get('/v3/image1.jpg')
          .reply(200, base64Decode(imageURL));
      const image = 'https://run.mocky.io/v3/image1.jpg';
      when(() => mockMusicProvider.isPlaying).thenAnswer((invocation) => false);
      // Define your mock data for testing

      // Build the ImageListView widget with the mock data
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<RecentlyPlayedBloc>(
            create: (context) => mockRecentlyPlayedBloc,
            child: ChangeNotifierProvider<MusicProvider>(
              create: (context) => mockMusicProvider,
              child: ImageListView(chartItems: createTestItems(image)),
            ),
          ),
        ),
      );

      // Verify that the widget is initially displayed
      expect(find.byType(ImageListView), findsOneWidget);
    });
  });
}

// Define a mock RecentlyPlayedBloc and other mocks if needed
class MockRecentlyPlayedBloc
    extends MockBloc<RecentlyPlayedBlocEvent, RecentlyPlayedBlocState>
    implements RecentlyPlayedBloc {}

class MockMusicProvider extends Mock implements MusicProvider {
  @override
  bool get isPlaying;
}

List<RecentlyPlayedSong> createTestItems(String image) {
  return [
    RecentlyPlayedSong(
      id: 1,
      headerImageUrl: image,
      artistNames: 'Artist ',
      title: 'Title ',
      preview: 'Preview',
      type: 'track',
    ),
    RecentlyPlayedSong(
      id: 1,
      headerImageUrl: image,
      artistNames: 'Artist ',
      title: 'Title ',
      preview: 'Preview',
      type: 'track',
    )
  ];
}
