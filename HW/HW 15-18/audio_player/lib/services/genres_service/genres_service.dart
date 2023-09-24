import 'dart:async';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/service.dart';

class GenresRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _genresService;
  GenresRepository(this._database, this._genresService);
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

  Future<List<MusicGenre>> getAllGenres() async {
    final isAvailable = await isTracksAvailable();
    if (isAvailable) {
      final result = await getGenresFromService();
      return cacheTracks(result);
    } else {
      return await _database.getallGenres();
    }
  }

  Future<List<Data>> getGenresFromService() async {
    final genresList = await _genresService.getGenres();

    final items = genresList.body?.data as List<Data>;
    return items;
  }

  Future<bool> isTracksAvailable() async {
    final dbTracks = await _database.getallGenres();
    return dbTracks.isEmpty;
  }
}
