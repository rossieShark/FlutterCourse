import 'package:audio_player/models/search_result/search_result_model.dart';
import 'package:audio_player/services/search_result/search_result_pagination.dart';
import 'package:audio_player/services/search_result/search_result_service.dart';

import 'package:audio_player/services/service.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final audioPlayerServiceMock = AudioPlayerServiceMock();
  final searchRepository = SearchResultRepository(audioPlayerServiceMock);
  final searchPaginationService =
      SearchResultPaginationService(searchRepository);

  group('getSearchResults', () {
    test('should return a list of MusicGenre from API', () async {
      // Arrange

      final tracksResponse = createTestSearchResponse();
      final response = createTestResponse(tracksResponse);

      when(() => audioPlayerServiceMock.getSearchResult('Joji', 0, 1))
          .thenAnswer((_) => Future.value(response));
      //act
      final result = await searchRepository.getSearchResults(0, 1, 'Joji');
      print(result);
      //assert
      expect(result, isNotNull);
      expect(result.length, 1);
      expect(result[0].artist.name, 'Joji');
    });
  });

  group('SearchResultPaginationService', () {
    test('should load more items', () async {
      // Arrange
      final tracksResponse = createTestSearchResponse();
      final response = createTestResponse(tracksResponse);

      when(() => audioPlayerServiceMock.getSearchResult('Joji', 0, 10))
          .thenAnswer((_) => Future.value(response));

      // Act
      await searchPaginationService.loadMoreItems('Joji');

      // Assert
      expect(searchPaginationService.items, isNotEmpty);
      expect(searchPaginationService.items.length, 1);
      expect(searchPaginationService.items[0].artist.name, 'Joji');
    });

    test('should clear items when search query is empty', () async {
      // Arrange
      searchPaginationService.items.add(SearchData(
        title: 'Sanctuary',
        artist: SearchDataArtist(image: "image", name: "Joji"),
        id: 1,
        preview: "preview",
        type: "type",
      ));

      // Act
      await searchPaginationService.loadMoreItems('');

      // Assert
      expect(searchPaginationService.items, isEmpty);
    });
  });
}

class AudioPlayerServiceMock extends Mock implements AudioPlayerService {}

// Helper methods to create test data

SearchResultResponce createTestSearchResponse() {
  return SearchResultResponce(data: [
    SearchData(
        title: 'Sanctuary',
        artist: SearchDataArtist(image: "image", name: "Joji"),
        id: 1,
        preview: "preview",
        type: "type"),
  ]);
}

Response<SearchResultResponce> createTestResponse(SearchResultResponce data) {
  return Response<SearchResultResponce>(
    http.Response('response_body', 200),
    data,
  );
}
