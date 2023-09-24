import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';

import 'package:audio_player/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('DetailMusicPageBloc', () {
    late GenresBloc genresBloc;
    late MockGenresRepository repository;

    setUp(() {
      repository = MockGenresRepository();
      genresBloc = GenresBloc(repository);
    });

    blocTest<GenresBloc, GenresState>(
      'emits GenresState when FetchGenresEvent is added',
      build: () {
        when(() => repository.getAllGenres()).thenAnswer((_) async =>
            [const MusicGenre(id: '1', image: 'image', name: 'name')]);
        return genresBloc;
      },
      act: (bloc) => bloc.add(FetchGenresEvent()),
      expect: () => [
        isA<GenresState>(),
      ],
    );
  });
}

class MockGenresRepository extends Mock implements GenresRepository {}
