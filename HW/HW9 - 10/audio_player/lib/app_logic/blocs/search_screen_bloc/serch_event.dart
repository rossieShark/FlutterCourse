abstract class SearchResultEvent {}

class FetchSearchResultEvent extends SearchResultEvent {
  final String q;

  FetchSearchResultEvent(this.q);
}
