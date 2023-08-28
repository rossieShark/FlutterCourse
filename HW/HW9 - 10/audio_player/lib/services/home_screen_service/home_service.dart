// ignore_for_file: non_constant_identifier_names
import 'package:audio_player/databases/database.dart';
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

class RecentlyPlayedRepository {
  final AudioDatabase _database;
  final RecentlyPlayedService recentlyPlayedService =
      RecentlyPlayedService.create();

  RecentlyPlayedRepository(this._database);

  Future<List<RecentlyPlayedSong>> cacheTracks(
      List<RecentlyPlayedlist> tracks) async {
    final songsToInsert = tracks.map((chartItem) {
      return RecentlyPlayedSong(
        artistNames: chartItem.item.artistNames ?? '',
        title: chartItem.item.title ?? '',
        headerImageUrl: chartItem.item.imageUrl ?? '',
        id: chartItem.item.id,
      );
    }).toList();

    await _database.addManySongs(songsToInsert);

    return songsToInsert;
  }

  Future<List<RecentlyPlayedSong>> getTracksFromDb() async {
    return await _database.allRecentlyPlayedSongs;
  }

  Future<List<RecentlyPlayedSong>> getTracks() async {
    final dbTracks = await _database.allRecentlyPlayedSongs;

    if (dbTracks.isNotEmpty) {
      return dbTracks;
    }

    final apiTracks = await recentlyPlayedService.getRecentlyPlayedTracks();
    final apiTracksResponse =
        apiTracks.body?.charItems as List<RecentlyPlayedlist>;

    return cacheTracks(apiTracksResponse);
  }
}

class FavoriteArtistRepository {
  final AudioDatabase _database;
  final RecentlyPlayedService recentlyPlayedService =
      RecentlyPlayedService.create();
  FavoriteArtistRepository(this._database);

  Future<List<FavoriteArtist>> cacheTracks(List<Artists> tracks) async {
    final songsToInsert = tracks.map((chartItem) {
      return FavoriteArtist(
        name: chartItem.item.name ?? '',
        id: chartItem.item.id,
        image: chartItem.item.imageUrl ?? '',
      );
    }).toList();

    await _database.addManyFavoriteArtists(songsToInsert);

    return songsToInsert;
  }

  Future<List<FavoriteArtist>> getTracksFromDb() async {
    return await _database.allFavouriteArtists;
  }

  Future<List<FavoriteArtist>> getFavoriteArtists() async {
    final dbTracks = await _database.allFavouriteArtists;

    if (dbTracks.isNotEmpty) {
      return dbTracks;
    }

    final apiArtists = await recentlyPlayedService.getFavorite();

    final apiArtistsResponse = apiArtists.body?.chartItems as List<Artists>;

    return cacheTracks(apiArtistsResponse);
  }
}

class BestAlbumRepository {
  final AudioDatabase _database;
  final RecentlyPlayedService recentlyPlayedService =
      RecentlyPlayedService.create();
  BestAlbumRepository(this._database);

  Future<List<BestAlbum>> cacheTracks(List<BestAlbumsList> tracks) async {
    final albumsToInsert = tracks.map((chartItem) {
      return BestAlbum(
        title: chartItem.item.fullTitle ?? '',
        id: chartItem.item.id,
        image: chartItem.item.coverImage ?? '',
        releaseDate: chartItem.item.releaseDate ?? '',
        detailAlbum: chartItem.item.id,
      );
    }).toList();

    await _database.addManyAlbums(albumsToInsert);

    return albumsToInsert;
  }

  Future<List<BestAlbum>> getTracksFromDb() async {
    return await _database.allBestAlbums;
  }

  Future<List<BestAlbum>> getBestAlbums(int perPage, int page) async {
    final dbTracks = await _database.allBestAlbums;
    print('dbTracks: ${dbTracks.length}');
    if (dbTracks.length < perPage * page) {
      return fetchAndCacheBestAlbums(perPage, page);
    }

    final startIndex = (page - 1) * perPage;
    print('startIndex: $startIndex');
    final endIndex = startIndex + perPage;
    print('endIndex: $endIndex');
    if (endIndex > dbTracks.length) {
      return fetchAndCacheBestAlbums(perPage, page);
    }

    return dbTracks.sublist(startIndex, endIndex);
  }

  Future<List<BestAlbum>> fetchAndCacheBestAlbums(int perPage, int page) async {
    final apiAlbums = await recentlyPlayedService.getBestAlbums(perPage, page);

    final apiAlbumsResponse =
        apiAlbums.body?.chartItems as List<BestAlbumsList>;

    return cacheTracks(apiAlbumsResponse);
  }
}
