import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/services/albums_detail/album_details_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('AlbumDetailBloc', () {
    late AlbumDetailBloc albumDetailBloc;
    late MockAlbumDetailsRepository repository;

    setUp(() {
      repository = MockAlbumDetailsRepository();
      albumDetailBloc = AlbumDetailBloc(repository);
    });

    blocTest<AlbumDetailBloc, AlbumDetailBlocState>(
      'emits AlbumDetailBlocState when FetchAlbumDetailBlocEvent is added',
      build: () {
        when(() => repository.getDetailAlbums(any())).thenAnswer((_) async => [
              const DetailAlbum(
                  albumid: 1,
                  id: 1,
                  artistNames: 'name',
                  preview: 'preview',
                  title: 'title',
                  type: 'type')
            ]);
        return albumDetailBloc;
      },
      act: (bloc) => bloc.add(FetchAlbumDetailBlocEvent('1')),
      expect: () => [
        isA<AlbumDetailBlocState>(),
      ],
    );
  });
}

class MockAlbumDetailsRepository extends Mock
    implements AlbumDetailsRepository {}
