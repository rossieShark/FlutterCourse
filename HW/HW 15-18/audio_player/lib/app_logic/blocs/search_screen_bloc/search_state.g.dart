// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmptySearchState _$$EmptySearchStateFromJson(Map<String, dynamic> json) =>
    _$EmptySearchState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptySearchStateToJson(_$EmptySearchState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingSearchState _$$LoadingSearchStateFromJson(Map<String, dynamic> json) =>
    _$LoadingSearchState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingSearchStateToJson(
        _$LoadingSearchState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NoResultsSearchState _$$NoResultsSearchStateFromJson(
        Map<String, dynamic> json) =>
    _$NoResultsSearchState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NoResultsSearchStateToJson(
        _$NoResultsSearchState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedSearchState _$$LoadedSearchStateFromJson(Map<String, dynamic> json) =>
    _$LoadedSearchState(
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchData.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedSearchStateToJson(_$LoadedSearchState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
