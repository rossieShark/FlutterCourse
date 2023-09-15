import 'package:project/databases/database.dart';
import 'package:project/services/service.dart';

import 'package:project/services/services.dart';
import 'package:get_it/get_it.dart';

class BestAlbumsPaginationService {
  bool _isLoading = false;

  final BestAlbumRepository _bestAlbumsRepository = BestAlbumRepository(
      GetIt.I<AudioAppDatabase>(), AudioPlayerService.create());
  final int _perPage = 10;
  int _index = 0;
  int _limit = 10;

  List<BestAlbum> items = [];

  bool get isLoading => _isLoading;

  Future<void> loadMoreItems() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final newPortion =
          await _bestAlbumsRepository.getBestAlbums(_index, _limit);

      items.addAll(newPortion);
      _index += _perPage;
      _limit += _perPage;
    } finally {
      _isLoading = false;
    }
  }
}
