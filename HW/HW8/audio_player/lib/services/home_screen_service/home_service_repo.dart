import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class RecentlyPlayedRepository {
  final RecentlyPlayedService recentlyPlayedService =
      RecentlyPlayedService.create();

  Future<List<ChartItems>> getTracks() async {
    final apiTracks = await recentlyPlayedService.getApi();

    final apiTracksResponse = apiTracks.body?.chart_items as List<ChartItems>;

    return apiTracksResponse;
  }

  Future<List<ChartItems>> getFavoriteArtists() async {
    final apiArtists = await recentlyPlayedService.getFavorite();

    final apiArtistsResponse = apiArtists.body?.chart_items as List<ChartItems>;

    return apiArtistsResponse;
  }

  Future<List<ChartItems>> getBestAlbums(int perPage, int page) async {
    final apiArtists = await recentlyPlayedService.getBestAlbums(perPage, page);

    final apiArtistsResponse = apiArtists.body?.chart_items as List<ChartItems>;

    return apiArtistsResponse;
  }
}
