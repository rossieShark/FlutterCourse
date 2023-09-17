// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'recently_played_model.freezed.dart';
part 'recently_played_model.g.dart';

@freezed
class RecentlyPlayedResponse with _$RecentlyPlayedResponse {
  factory RecentlyPlayedResponse({
    required Tracks tracks,
  }) = _RecentlyPlayedResponse;
  static const fromJsonFactory = _$RecentlyPlayedResponseFromJson;
  factory RecentlyPlayedResponse.fromJson(Map<String, Object?> json) =>
      _$RecentlyPlayedResponseFromJson(json);
}

@freezed
class Tracks with _$Tracks {
  factory Tracks({required List<Data> data}) = _Tracks;

  factory Tracks.fromJson(Map<String, Object?> json) => _$TracksFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data(
      {required String title,
      required Artist artist,
      required int id,
      required String preview,
      required String type}) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
class Artist with _$Artist {
  factory Artist(
      {required String name,
      @JsonKey(name: 'picture_big') required String image,
      required int id}) = _Artist;

  factory Artist.fromJson(Map<String, Object?> json) => _$ArtistFromJson(json);
}
