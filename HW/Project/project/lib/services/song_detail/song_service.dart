import 'package:project/databases/database.dart';
import 'package:project/services/service.dart';

class SongDetailRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _songDetailsService = AudioPlayerService.create();

  SongDetailRepository(this._database);

  Future<DetailInfoSong?> getDetailSongInfo(String id) async {
    try {
      final int songId = int.parse(id);

      // Try to get detailed song info from the database
      final detailSong = await _database.watchDetailSongById(songId).first;

      // If detailSong is not found in the database, fetch it from the API and save it to the database
      if (detailSong == null) {
        try {
          final apiResponse = await _songDetailsService.getDetailSongs(id);

          if (apiResponse.isSuccessful) {
            final albumAppearances = apiResponse.body;
            final detailSongToInsert = DetailInfoSong(
              type: albumAppearances?.type ?? 'track',
              id: int.parse(id),
              preview: albumAppearances?.preview ?? '',
              artistNames: albumAppearances?.contributors[0].name ?? '',
              title: albumAppearances?.title ?? '',
              imageUrl: albumAppearances?.contributors[0].image ?? '',
            );

            // Insert the detail song into the database
            await _database.insertDetailSong(detailSongToInsert);

            return detailSongToInsert;
          } else {
            // Handle API request failure here
            print('API request failed: ${apiResponse.error}');
            return null;
          }
        } catch (apiException) {
          // Handle exceptions related to the API request here
          print('API request error: $apiException');
          return null;
        }
      }

      return detailSong; // Return from the database or the newly inserted data
    } catch (e) {
      // Handle exceptions related to parsing or database access here
      print('Error: $e');
      return null;
    }
  }
}
