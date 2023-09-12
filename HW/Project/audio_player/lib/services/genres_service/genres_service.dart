import 'dart:async';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/service.dart';

class GenresRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _genresService = AudioPlayerService.create();
  GenresRepository(this._database);
  Future<List<MusicGenre>> cacheTracks(List<Data> tracks) async {
    final genresToInsert = tracks.map((item) {
      return MusicGenre(
        id: item.id.toString(),
        name: item.name,
        image: item.image,
      );
    }).toList();

    await _database.addManyGenres(genresToInsert);

    return genresToInsert;
  }

  Future<List<MusicGenre>> getTracksFromDb() async {
    final isAvailable = await isTracksAvailable();
    if (isAvailable) {
      final result = await getGenres();
      return cacheTracks(result);
    } else {
      return await _database.allGenres;
    }
  }

  Future<List<Data>> getGenres() async {
    final genresList = await _genresService.getGenres();

    final items = genresList.body?.data as List<Data>;
    return items;
  }

  Future<bool> isTracksAvailable() async {
    final dbTracks = await _database.allGenres;
    return dbTracks.isEmpty;
  }
}
