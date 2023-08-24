import 'dart:async';
import 'package:audio_player/models/home_screen_data/favourite_artist_model/favourite_artist_model.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/models/recently_played_model/recently_played_model.dart';
import 'package:chopper/chopper.dart';

final Map<Type, Object Function(Map<String, dynamic>)> generatedMapping = {
  BestAlbumsResponse: BestAlbumsResponse.fromJsonFactory,
  AlbumDetailsResponse: AlbumDetailsResponse.fromJsonFactory,
  SongDetailsResponce: SongDetailsResponce.fromJsonFactory,
  SearchResultResponce: SearchResultResponce.fromJsonFactory,
  GenresResponse: GenresResponse.fromJsonFactory,
  FavouriteArtistResponse: FavouriteArtistResponse.fromJsonFactory,
  RecentlyPlayedResponse: RecentlyPlayedResponse.fromJsonFactory
};

class $JsonSerializableConverter extends JsonConverter {
  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
      Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);
