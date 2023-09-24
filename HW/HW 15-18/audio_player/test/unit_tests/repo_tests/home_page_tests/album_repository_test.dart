import 'package:audio_player/databases/database.dart';
import 'package:audio_player/services/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final bestAlbumRepository = MockBestAlbumRepository();
  final service = BestAlbumsPaginationService(bestAlbumRepository);
  group('AlbumRepository', () {
    test('getAlbums should return a list of BestAlbums', () async {
      // Define a mock response for getBestAlbums method
      when(() => bestAlbumRepository.getBestAlbums(any(), any())).thenAnswer(
        (_) async => [
          const BestAlbum(
              id: 1,
              artist: 'artist',
              detailAlbum: 1,
              image: 'image',
              title: 'title',
              type: 'album'),
          const BestAlbum(
              id: 2,
              artist: 'artist',
              detailAlbum: 2,
              image: 'image',
              title: 'title',
              type: 'album'),
        ],
      );

      final albums = await bestAlbumRepository.getBestAlbums(0, 1);

      // Add your assertions here to check if the albums are loaded correctly
      expect(albums, isNotEmpty);
      expect(albums.length, 2);
      expect(albums, isA<List<BestAlbum>>());
    });
  });

  group('BestAlbumsPaginationService', () {
    test('loadMoreItems should load more albums', () async {
      when(() => bestAlbumRepository.getBestAlbums(any(), any())).thenAnswer(
        (_) async => [
          const BestAlbum(
              id: 1,
              artist: 'artist',
              detailAlbum: 1,
              image: 'image',
              title: 'title',
              type: 'album'),
          const BestAlbum(
              id: 2,
              artist: 'artist',
              detailAlbum: 2,
              image: 'image',
              title: 'title',
              type: 'album'),
        ],
      );

      await service.loadMoreItems();

      // Add your assertions here to check if items are loaded correctly
      expect(service.items, isNotEmpty);
      expect(service.isLoading, false);
      expect(service.items, isA<List<BestAlbum>>());
    });
  });
}

class MockBestAlbumRepository extends Mock implements BestAlbumRepository {}
