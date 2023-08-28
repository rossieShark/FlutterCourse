import 'dart:async';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/json_serializable.dart';
import 'package:chopper/chopper.dart';

part 'genres_service.chopper.dart';

@ChopperApi(baseUrl: "https://spotify23.p.rapidapi.com")
abstract class GenresService extends ChopperService {
  static GenresService create() => _$GenresService(
        ChopperClient(
            interceptors: [HeaderInterceptor1()],
            converter: $JsonSerializableConverter()),
      );

  @Get(path: '/genre_view/?id=0JQ5DAqbMKFEC4WFtoNRpw&content_limit=10&limit=20')
  Future<Response<GenresResponse>> getGenres();
}

class HeaderInterceptor1 extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    request.headers['X-RapidAPI-Key'] =
        '13eeb99b4fmsha431d496ff5d969p19908cjsn5cf18e4e0ca1';
    request.headers['X-RapidAPI-Host'] = 'spotify23.p.rapidapi.com';
    return request;
  }
}

class GenresRepository {
  final AudioDatabase _database;
  final GenresService _genresService = GenresService.create();
  GenresRepository(this._database);
  Future<List<MusicGenre>> cacheTracks(List<Items> tracks) async {
    final genresToInsert = tracks.map((item) {
      return MusicGenre(
        id: item.id,
        name: item.name ?? '',
        image: tracks[0].images[1].url ?? '',
      );
    }).toList();

    await _database.addManyGenres(genresToInsert);

    return genresToInsert;
  }

  Future<List<MusicGenre>> getTracksFromDb() async {
    return await _database.allGenres;
  }

  Future<List<MusicGenre>> getGenres() async {
    final dbTracks = await _database.allGenres;

    if (dbTracks.isNotEmpty) {
      return dbTracks;
    }
    // await Future.delayed(const Duration(seconds: 1));
    print('Data is fetching');
    final genresList = await _genresService.getGenres();

    final items = genresList.body?.content.items as List<Items>;
    return cacheTracks(items);
  }
}
