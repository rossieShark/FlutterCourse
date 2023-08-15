// ignore_for_file: non_constant_identifier_names
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';
import 'package:chopper/chopper.dart';

part 'home_service.chopper.dart';

@ChopperApi(baseUrl: "https://genius-song-lyrics1.p.rapidapi.com")
abstract class RecentlyPlayedService extends ChopperService {
  static RecentlyPlayedService create() => _$RecentlyPlayedService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );
  @Get(path: '/chart/songs/')
  Future<Response<TracksResponce>> getApi();

  @Get(path: 'chart/artists/?time_period=week&per_page=15&page=2')
  Future<Response<TracksResponce>> getFavorite();

  @Get(path: '/chart/albums/')
  Future<Response<TracksResponce>> getBestAlbums(
      @Query() int per_page, @Query() int page);
}
