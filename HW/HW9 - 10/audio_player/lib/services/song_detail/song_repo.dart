import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class SongDetailRepository {
  final SongDetailsService songDetailsService = SongDetailsService.create();

  Future<SongDetail> getSongInfo(String id) async {
    // await Future.delayed(const Duration(seconds: 1));
    print('Data is fetching');
    final songsList = await songDetailsService.getSongInfo(id);

    final albumAppearances = songsList.body?.song as SongDetail;

    return albumAppearances;
  }
}
// SongDetailRepository {
//   final AudioDatabase _database;
//   final SongDetailsService _songDetailsService = SongDetailsService.create();

//   SongDetailRepository(this._database);

//   Future<DetailInfoSong?> getDetailSongInfo(String id) async {
//     final int songId = int.parse(id);

//     // Try to get detail song from the database
//     final detailSong = await _database.watchDetailSongById(songId).first;

//     // If detailSong is not found in the database, fetch from API and save to the database
//     if (detailSong == null) {
//       final apiDetailSong = await _songDetailsService.getSongInfo(id);
//       if (apiDetailSong != null) {
//         final albumAppearances = apiDetailSong.body?.song;

//         final detailSongToInsert = DetailInfoSong(
//           id: int.parse(id),
//           artistNames: albumAppearances?.artistNames ?? '',
//           title: albumAppearances?.title ?? '',
//           imageUrl: albumAppearances?.imageUrl ?? '',
//         );
//         await _database.insertDetailSong(detailSongToInsert);
//         return detailSongToInsert;
//       }
//     }

//     return detailSong; // Return from the database or the newly inserted data
//   }