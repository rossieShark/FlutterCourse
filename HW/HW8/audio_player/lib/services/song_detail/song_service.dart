import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';
import 'package:chopper/chopper.dart';

part 'song_service.chopper.dart';

@ChopperApi(baseUrl: "https://genius-song-lyrics1.p.rapidapi.com")
abstract class SongDetailsService extends ChopperService {
  static SongDetailsService create() => _$SongDetailsService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );

  @Get(path: 'song/details/')
  Future<Response<SongDetailsResponce>> getSongInfo(@Query() String id);
}
