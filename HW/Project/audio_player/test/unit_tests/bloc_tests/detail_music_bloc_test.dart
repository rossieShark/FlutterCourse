import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';

import 'package:audio_player/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('DetailMusicPageBloc', () {
    late DetailMusicPageBloc detailMusicPageBloc;
    late MockSongDetailRepository repository;

    setUp(() {
      repository = MockSongDetailRepository();
      detailMusicPageBloc = DetailMusicPageBloc(repository);
    });

    blocTest<DetailMusicPageBloc, DetailMusicPageState>(
      'emits AlbumDetailBlocState when FetchAlbumDetailBlocEvent is added',
      build: () {
        when(() => repository.getDetailSongInfo(any())).thenAnswer((_) async =>
            const DetailInfoSong(
                artistNames: 'name',
                id: 1,
                imageUrl: 'image',
                preview: 'preview',
                title: 'title',
                type: 'type'));
        return detailMusicPageBloc;
      },
      act: (bloc) => bloc.add(FetchSongDetailEvent('1')),
      expect: () => [
        isA<DetailMusicPageState>(),
      ],
    );
  });
}

class MockSongDetailRepository extends Mock implements SongDetailRepository {}
