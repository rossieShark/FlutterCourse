// ignore_for_file: non_constant_identifier_names
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/models/home_screen_data/home_screen_data.dart';

import 'package:audio_player/models/recently_played_model/recently_played_model.dart';
import 'package:audio_player/services/service.dart';

class RecentlyPlayedRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService recentlyPlayedService = AudioPlayerService.create();

  RecentlyPlayedRepository(this._database);

  Future<List<RecentlyPlayedSong>> cacheTracks(List<Data> tracks) async {
    final songsToInsert = tracks.map((track) {
      return RecentlyPlayedSong(
        type: track.type,
        artistNames: track.artist.name,
        title: track.title,
        headerImageUrl: track.artist.image,
        preview: track.preview,
        id: track.id,
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
    final apiTracksResponse = apiTracks.body?.tracks.data as List<Data>;

    return cacheTracks(apiTracksResponse);
  }
}

class FavoriteArtistRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService recentlyPlayedService = AudioPlayerService.create();
  FavoriteArtistRepository(this._database);

  Future<List<FavoriteArtist>> cacheTracks(List<Artists> tracks) async {
    final songsToInsert = tracks.map((artist) {
      return FavoriteArtist(
        name: artist.name,
        id: artist.id,
        image: artist.image,
      );
    }).toList();

    await _database.addManyFavoriteArtists(songsToInsert);

    return songsToInsert;
  }

  Future<List<FavoriteArtist>> getTracksFromDb() async {
    return await _database.getallFavouriteArtists();
  }

  Future<List<FavoriteArtist>> getFavoriteArtists() async {
    final dbTracks = await getTracksFromDb();

    if (dbTracks.isNotEmpty) {
      return dbTracks;
    }

    final apiArtists = await recentlyPlayedService.getFavoriteArtists();

    final apiArtistsResponse = apiArtists.body?.data as List<Artists>;

    return cacheTracks(apiArtistsResponse);
  }
}

class BestAlbumRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _recentlyPlayedService;

  BestAlbumRepository(this._database, this._recentlyPlayedService);

  Future<List<BestAlbum>> cacheAlbums(List<BestAlbumsList> albums) async {
    final albumsToInsert = albums.map((album) {
      return BestAlbum(
          type: album.type,
          title: album.title,
          id: album.id,
          image: album.coverImage,
          detailAlbum: album.id,
          artist: album.artist.name);
    }).toList();

    await _database.addManyAlbums(albumsToInsert);

    return albumsToInsert;
  }

  Future<List<BestAlbum>> getAlbumsFromDb() async {
    return await _database.allBestAlbums;
  }

  Future<List<BestAlbum>> getBestAlbums(int index, int limit) async {
    final dbAlbums = await _database.allBestAlbums;

    if (dbAlbums.length < limit) {
      return fetchAndCacheBestAlbums(index, limit);
    }

    final startIndex = index;
    final endIndex = limit;

    if (endIndex > dbAlbums.length) {
      return fetchAndCacheBestAlbums(index, limit);
    }

    return dbAlbums.sublist(startIndex, endIndex);
  }

  Future<List<BestAlbum>> fetchAndCacheBestAlbums(int index, int limit) async {
    try {
      final apiAlbumsResponse =
          await _recentlyPlayedService.getBestAlbums(index, limit);

      final apiAlbums = apiAlbumsResponse.body?.data as List<BestAlbumsList>;

      return cacheAlbums(apiAlbums);
    } catch (e) {
      return [];
    }
  }
}
