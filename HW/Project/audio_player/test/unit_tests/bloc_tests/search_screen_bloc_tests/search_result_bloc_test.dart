import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  group('SearchResultBloc', () {
    late SearchResultBloc searchResultBloc;
    late MockSearchRepository searchRepository;

    setUp(() {
      searchRepository = MockSearchRepository();
      searchResultBloc = SearchResultBloc(searchRepository);
    });

    tearDown(() {
      searchResultBloc.close();
    });

    blocTest<SearchResultBloc, SearchState>(
      'emits loading and loaded states when LoadSearchEvent is added with results',
      build: () {
        createAlbumDetails();
        when(() => searchRepository.getSearchResult('query'))
            .thenAnswer((_) async => createAlbumDetails());
        return searchResultBloc;
      },
      act: (bloc) => bloc.add(const LoadSearchEvent(newText: 'query')),
      expect: () => [
        isA<LoadingSearchState>(), // Use isA matcher for type checking
        isA<LoadedSearchState>(),
      ],
    );
    blocTest<SearchResultBloc, SearchState>(
      'emits loading and noResults states when LoadSearchEvent is added with no results',
      build: () {
        when(() => searchRepository.getSearchResult('query'))
            .thenAnswer((_) async => []);
        return searchResultBloc;
      },
      act: (bloc) => bloc.add(const LoadSearchEvent(newText: 'query')),
      expect: () => [
        isA<LoadingSearchState>(), // Use isA matcher for type checking
        isA<NoResultsSearchState>(),
      ],
    );
    blocTest<SearchResultBloc, SearchState>(
      'emits  loaded states when LoadMoreItemsSearchEvent is added with results',
      build: () {
        createAlbumDetails();
        when(() => searchRepository.getSearchResult('query'))
            .thenAnswer((_) async => createAlbumDetails());
        return searchResultBloc;
      },
      act: (bloc) => bloc.add(const LoadMoreItemsSearchEvent(text: 'query')),
      expect: () => [
        // Use isA matcher for type checking
        isA<LoadedSearchState>(),
      ],
    );
    blocTest<SearchResultBloc, SearchState>(
      'emits LoadSearchEvent after a delay when TextChangedSearchEvent is added',
      build: () {
        // Mock the behavior of repository.getAlbums
        when(() => searchRepository.getSearchResult('query'))
            .thenAnswer((_) async => []);

        return searchResultBloc;
      },
      act: (bloc) {
        // Add TextChangedSearchEvent to the bloc
        bloc.add(const TextChangedSearchEvent(newText: 'query'));
      },
      expect: () => [
        isA<NoResultsSearchState>(), // Expect a loading state when TextChangedSearchEvent is added
      ],
      wait: const Duration(seconds: 1), // Wait for 1 second (the delay)
      skip: 1, // Skip the initial loading state
      verify: (_) {
        // Verify that LoadSearchEvent was added to the bloc after the delay
        verify(() => searchRepository.getSearchResult('query')).called(1);
      },
    );
    blocTest<SearchResultBloc, SearchState>(
      'emits LoadSearchEvent after a delay when TextChangedSearchEvent is added',
      build: () {
        // Mock the behavior of repository.getAlbums
        when(() => searchRepository.getSearchResult('query'))
            .thenAnswer((_) async => createAlbumDetails());

        return searchResultBloc;
      },
      act: (bloc) {
        // Add TextChangedSearchEvent to the bloc
        bloc.add(const TextChangedSearchEvent(newText: 'query'));
      },
      expect: () => [
        isA<LoadedSearchState>(), // Expect a loading state when TextChangedSearchEvent is added
      ],
      wait: const Duration(seconds: 1), // Wait for 1 second (the delay)
      skip: 1, // Skip the initial loading state
      verify: (_) {
        // Verify that LoadSearchEvent was added to the bloc after the delay
        verify(() => searchRepository.getSearchResult('query')).called(1);
      },
    );
    blocTest<SearchResultBloc, SearchState>(
      'emits empty state when LoadSearchEvent is added with empty text',
      build: () {
        return searchResultBloc;
      },
      act: (bloc) =>
          bloc.add(const LoadSearchEvent(newText: '')), // Pass empty text
      expect: () => [
        isA<EmptySearchState>(), // Expect an empty state
      ],
    );
  });
  group('SearchRepository', () {
    test('getAlbums should return a list of SearchData', () async {
      final service = MockSearchResultPaginationService();
      final repository = SearchRepository(service);
      // Arrange
      when(() => service.loadMoreItems('query')).thenAnswer((_) async {});
      when(() => service.items)
          .thenReturn(createAlbumDetails()); // Set items to an empty list

      // Act
      final albums = await repository.getSearchResult('query');

      // Assert
      expect(albums, isNotEmpty);
      expect(albums, isA<List<SearchData>>());
    });
  });
}

class MockSearchResultPaginationService extends Mock
    implements SearchResultPaginationService {}

List<SearchData> createAlbumDetails() {
  return [
    SearchData(
        artist: SearchDataArtist(image: 'image', name: 'artist1'),
        id: 1,
        preview: 'preview',
        title: 'title',
        type: 'track'),
    SearchData(
        artist: SearchDataArtist(image: 'image', name: 'artist2'),
        id: 2,
        preview: 'preview',
        title: 'title',
        type: 'track'),
  ];
}
