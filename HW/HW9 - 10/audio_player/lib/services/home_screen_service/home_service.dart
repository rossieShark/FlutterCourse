// ignore_for_file: non_constant_identifier_names
import 'package:audio_player/models/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/models/recently_played_model/recently_played_model.dart';
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
  Future<Response<RecentlyPlayedResponse>> getRecentlyPlayedTracks();

  @Get(path: 'chart/artists/?time_period=week&per_page=15&page=2')
  Future<Response<FavouriteArtistResponse>> getFavorite();

  @Get(path: '/chart/albums/')
  Future<Response<BestAlbumsResponse>> getBestAlbums(
      @Query('per_page') int perPage, @Query() int page);
}
