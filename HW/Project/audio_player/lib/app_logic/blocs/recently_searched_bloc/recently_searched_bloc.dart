import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

class RecentlySearchedBloc
    extends Bloc<RecentlySearchedEvent, RecentlySearchedState> {
  final RecentlySearchedProvider recentlySearchedProvider;

  RecentlySearchedBloc(this.recentlySearchedProvider)
      : super(RecSearchedInitialState()) {
    on<AddToRecentlySearchedEvent>(_onAddSongToList);
  }

  Future<void> _onAddSongToList(AddToRecentlySearchedEvent event,
      Emitter<RecentlySearchedState> emit) async {
    recentlySearchedProvider.addToFavorites(event.songModel);
    emit(RecSearchedAddedState());
  }
}
