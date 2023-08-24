import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';
import 'package:chopper/chopper.dart';

part 'album_details_service.chopper.dart';

@ChopperApi(baseUrl: "https://genius-song-lyrics1.p.rapidapi.com")
abstract class AlbumDetailsService extends ChopperService {
  static AlbumDetailsService create() => _$AlbumDetailsService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );

  @Get(path: 'album/appearances/')
  Future<Response<AlbumDetailsResponse>> getAlbumSongsList(@Query() String id);
}
