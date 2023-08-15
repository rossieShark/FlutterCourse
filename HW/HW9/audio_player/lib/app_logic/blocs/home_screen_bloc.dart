import 'package:audio_player/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

abstract class AlbumEvent {}

class FetchAlbumsEvent extends AlbumEvent {}

// State
class AlbumState {
  final List<ChartItems> feed;

  AlbumState(this.feed);
}

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
//   Stream<AlbumState> mapEventToState(AlbumEvent event) async* {
//     try {
//       final albums = await repository.getAlbums();
//       yield AlbumState(albums);
//     } catch (error) {
//
//     }
//   }
// }

class AlbumRepository {
  final BestAlbumsPaginationService _service = BestAlbumsPaginationService();

  Future<List<ChartItems>> getAlbums() async {
    await _service.loadMoreItems();
    return _service.items;
  }
}

abstract class FavoriteArtistEvent {}

class FetchFavoriteArtistsEvent extends FavoriteArtistEvent {}

class FavoriteArtistState {
  final List<ChartItems> favoriteArtistList;

  FavoriteArtistState(this.favoriteArtistList);
}

class FavoriteArtistBloc
    extends Bloc<FavoriteArtistEvent, FavoriteArtistState> {
  final RecentlyPlayedRepository repository;

  FavoriteArtistBloc(this.repository) : super(FavoriteArtistState([])) {
    on<FetchFavoriteArtistsEvent>(_fetchFavoriteArtists);
  }

  void _fetchFavoriteArtists(FetchFavoriteArtistsEvent event,
      Emitter<FavoriteArtistState> emit) async {
    try {
      final favoriteArtists = await repository.getFavoriteArtists();
      emit(FavoriteArtistState(favoriteArtists));
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}

abstract class RecentlyPlayedBlocEvent {}

class FetchRecentlyPlayedEvent extends RecentlyPlayedBlocEvent {}

class RecentlyPlayedBlocState {
  final List<ChartItems> recentlyPlayedtList;

  RecentlyPlayedBlocState(this.recentlyPlayedtList);
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
      final recentlyPlayedtList = await repository.getTracks();
      emit(RecentlyPlayedBlocState(recentlyPlayedtList));
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}
