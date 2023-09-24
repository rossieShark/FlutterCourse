import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/detail_music_screen/detail_music_index.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets('CreateTitleSection widget test', (WidgetTester tester) async {
    // Create a songInfo object for testing.
    final mockFavoriteBloc = MockFavoriteBloc();
    when(() => mockFavoriteBloc.state)
        .thenReturn(FavoriteSongUpdatedState(true));
    // when(() => MockFavouriteProvider().isFavoriteSong(any())).thenReturn(true);
    const songInfo = DetailInfoSong(
      artistNames: 'Artist Name',
      title: 'Song Title',
      preview: 'Preview URL',
      id: 1,
      imageUrl: 'Image URL',
      type: 'track',
    );

    // Build the CreateTitleSection widget with the songInfo.
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<FavoriteProvider>(
              create: (_) => MockFavouriteProvider(),
            ),
            Provider<FavoriteBloc>(
              create: (_) => mockFavoriteBloc,
            ),
          ],
          child: const Scaffold(
            body: CreateTitleSection(
              songInfo: songInfo,
              param: 'Test Param',
            ),
          ),
        ),
      ),
    );

    // Verify that the widget is initially displayed.
    expect(find.byType(CreateTitleSection), findsOneWidget);
    expect(find.byType(IconButtonWidget), findsOneWidget);
    expect(find.byType(CreateSongTitle), findsOneWidget);
    expect(find.byType(LikeButtonWidget), findsOneWidget);

    // Verify the properties of the IconButtonWidget.
    final iconButtonWidget = find
        .byType(IconButtonWidget)
        .evaluate()
        .first
        .widget as IconButtonWidget;
    expect(iconButtonWidget.iconData, Icons.ios_share);
    expect(iconButtonWidget.color, AppColors.accent.color);

    // Verify the properties of the CreateSongTitle widget.
    final createSongTitleWidget =
        find.byType(CreateSongTitle).evaluate().first.widget as CreateSongTitle;
    expect(createSongTitleWidget.artistName, songInfo.artistNames);
    expect(createSongTitleWidget.songTitle, songInfo.title);
    expect(createSongTitleWidget.crossAxisAlignment, CrossAxisAlignment.center);

    // Verify the properties of the LikeButtonWidget.
    final likeButtonWidget = find
        .byType(LikeButtonWidget)
        .evaluate()
        .first
        .widget as LikeButtonWidget;
    expect(likeButtonWidget.preview, songInfo.preview);
    expect(likeButtonWidget.id, songInfo.id.toString());
    expect(likeButtonWidget.artistNames, songInfo.artistNames);
    expect(likeButtonWidget.title, songInfo.title);
    expect(likeButtonWidget.image, songInfo.imageUrl);

    // You can add more specific assertions as needed.
  });
}

class MockFavouriteProvider extends Mock implements FavoriteProvider {
  @override
  bool isFavoriteSong(String songId) {
    // Replace this with your logic to return true or false based on the songId.
    return true;
  }
}

class MockFavoriteBloc extends MockBloc<FavoriteEvent, FavoriteState>
    implements FavoriteBloc {}
