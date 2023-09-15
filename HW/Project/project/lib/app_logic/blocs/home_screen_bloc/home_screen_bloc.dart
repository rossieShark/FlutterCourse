import 'package:project/app_logic/blocs/bloc_exports.dart';
import 'package:project/databases/database.dart';
import 'package:project/services/services.dart';

// BLoC
class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc(this.repository) : super(AlbumState([])) {
    on<FetchAlbumsEvent>(_fetchAlbums);
  }

  void _fetchAlbums(FetchAlbumsEvent event, Emitter<AlbumState> emit) async {
    try {
      final albums = await repository.getAlbums();
      emit(AlbumState(albums));
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}

class AlbumRepository {
  final BestAlbumsPaginationService _service = BestAlbumsPaginationService();

  Future<List<BestAlbum>> getAlbums() async {
    await _service.loadMoreItems();
    return _service.items;
  }
}

class FavoriteArtistBloc
    extends Bloc<FavoriteArtistEvent, FavoriteArtistState> {
  final FavoriteArtistRepository repository;

  FavoriteArtistBloc(this.repository) : super(FavoriteArtistState([])) {
    on<FetchFavoriteArtistsEvent>(_fetchFavoriteArtists);
  }

  void _fetchFavoriteArtists(FetchFavoriteArtistsEvent event,
      Emitter<FavoriteArtistState> emit) async {
    try {
      final favoriteArtists = await repository.getTracksFromDb();
      if (favoriteArtists.isEmpty) {
        final artists = await repository.getFavoriteArtists();
        emit(FavoriteArtistState(artists));
      } else {
        emit(FavoriteArtistState(favoriteArtists));
      }
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}

class RecentlyPlayedBloc
    extends Bloc<RecentlyPlayedBlocEvent, RecentlyPlayedBlocState> {
  final RecentlyPlayedRepository repository;

  RecentlyPlayedBloc(this.repository) : super(RecentlyPlayedBlocState([])) {
    on<FetchRecentlyPlayedEvent>(_fetchRecentlyPlayed);
  }

  void _fetchRecentlyPlayed(FetchRecentlyPlayedEvent event,
      Emitter<RecentlyPlayedBlocState> emit) async {
    try {
      final recentlyPlayedtList = await repository.getTracksFromDb();
      if (recentlyPlayedtList.isEmpty) {
        final tracks = await repository.getTracks();
        emit(RecentlyPlayedBlocState(tracks));
      } else {
        emit(RecentlyPlayedBlocState(recentlyPlayedtList));
      }
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}
