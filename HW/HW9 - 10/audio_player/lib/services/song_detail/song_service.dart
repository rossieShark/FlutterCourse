import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';
import 'package:chopper/chopper.dart';

part 'song_service.chopper.dart';

@ChopperApi(baseUrl: "https://genius-song-lyrics1.p.rapidapi.com")
abstract class SongDetailsService extends ChopperService {
  static SongDetailsService create() => _$SongDetailsService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );

  @Get(path: 'song/details/')
  Future<Response<SongDetailsResponce>> getSongInfo(@Query() String id);
}

class SongDetailRepository {
  final AudioDatabase _database;
  final SongDetailsService _songDetailsService = SongDetailsService.create();

  SongDetailRepository(this._database);

  Future<DetailInfoSong?> getDetailSongInfo(String id) async {
    final int songId = int.parse(id);

    // Try to get detail song from the database
    final detailSong = await _database.watchDetailSongById(songId).first;

    // If detailSong is not found in the database, fetch from API and save to the database
    if (detailSong == null) {
      final apiDetailSong = await _songDetailsService.getSongInfo(id);
      final albumAppearances = apiDetailSong.body?.song;
      final detailSongToInsert = DetailInfoSong(
        id: int.parse(id),
        artistNames: albumAppearances?.artistNames ?? '',
        title: albumAppearances?.title ?? '',
        imageUrl: albumAppearances?.imageUrl ?? '',
      );
      await _database.insertDetailSong(detailSongToInsert);
      return detailSongToInsert;
    }

    return detailSong; // Return from the database or the newly inserted data
  }
}
