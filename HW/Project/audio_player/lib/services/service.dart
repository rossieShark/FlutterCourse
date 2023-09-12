import 'package:audio_player/models/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/models/recently_played_model/recently_played_model.dart';
import 'package:audio_player/services/services.dart';
import 'package:chopper/chopper.dart';

part 'service.chopper.dart';

@ChopperApi(baseUrl: "https://api.deezer.com")
abstract class AudioPlayerService extends ChopperService {
  static AudioPlayerService create() => _$AudioPlayerService(
        ChopperClient(converter: $JsonSerializableConverter()),
      );

  @Get(path: '/album/{id}/tracks')
  Future<Response<AlbumDetailsResponse>> getAlbumSongsList(
      @Path('id') String id);

  @Get(path: '/genre')
  Future<Response<GenresResponse>> getGenres();

  @Get(path: '/chart/tracks')
  Future<Response<RecentlyPlayedResponse>> getRecentlyPlayedTracks();

  @Get(path: '/chart/0/artists')
  Future<Response<FavouriteArtistResponse>> getFavoriteArtists();

  @Get(path: '/chart/0/albums?')
  Future<Response<BestAlbumsResponse>> getBestAlbums(
    @Query('index') int index,
    @Query('limit') int limit,
  );
  @Get(path: '/search?')
  Future<Response<SearchResultResponce>> getSearchResult(
    @Query('q') String query,
    @Query('index') int index,
    @Query('limit') int limit,
  );
  @Get(path: '/track/{id}')
  Future<Response<SongDetailsResponce>> getDetailSongs(@Path('id') String id);
}
