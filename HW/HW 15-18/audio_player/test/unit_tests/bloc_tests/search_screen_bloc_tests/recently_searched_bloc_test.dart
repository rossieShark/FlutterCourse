import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecentlySearchedProvider extends Mock
    implements RecentlySearchedProvider {}

void main() {
  late RecentlySearchedBloc recentlySearchedBloc;
  late MockRecentlySearchedProvider recentlySearchedProvider;

  setUp(() {
    recentlySearchedProvider = MockRecentlySearchedProvider();
    recentlySearchedBloc = RecentlySearchedBloc(recentlySearchedProvider);
  });

  tearDown(() {
    recentlySearchedBloc.close();
  });

  group('RecentlySearchedBloc', () {
    final songModelToAdd = SongModel(
        artistNames: 'name',
        id: '1',
        image: 'image',
        preview: 'preview',
        title: 'title',
        type: 'type');

    blocTest<RecentlySearchedBloc, RecentlySearchedState>(
      'emits RecSearchedAddedState when AddToRecentlySearchedEvent is added',
      build: () {
        when(() => recentlySearchedProvider.addToFavorites(songModelToAdd))
            .thenAnswer((_) async => Future<void>.value());
        return recentlySearchedBloc;
      },
      act: (bloc) => bloc.add(AddToRecentlySearchedEvent(songModelToAdd)),
      expect: () => [
        isA<RecSearchedAddedState>(),
      ],
      verify: (_) {
        // Verify that addToFavorites was called with the expected songModel
        verify(() => recentlySearchedProvider.addToFavorites(songModelToAdd))
            .called(1);
      },
    );
  });
}
