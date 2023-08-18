import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class GenresRepository {
  final GenresService _genresService = GenresService.create();

  Future<List<Items>> getGenres() async {
    // await Future.delayed(const Duration(seconds: 1));
    print('Data is fetching');
    final genresList = await _genresService.getGenres();

    final items = genresList.body?.content.items as List<Items>;
    print(items);
    return items;
  }
}
