import 'dart:async';

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

  @Get(path: 'genre_view/?id=0JQ5DAqbMKFEC4WFtoNRpw&content_limit=0&limit=20')
  Future<Response<GenresResponce>> getGenres();
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
