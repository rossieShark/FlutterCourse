// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RecentlyPlayedSongsTable extends RecentlyPlayedSongs
    with TableInfo<$RecentlyPlayedSongsTable, RecentlyPlayedSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentlyPlayedSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _artistNamesMeta =
      const VerificationMeta('artistNames');
  @override
  late final GeneratedColumn<String> artistNames = GeneratedColumn<String>(
      'artist_names', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _headerImageUrlMeta =
      const VerificationMeta('headerImageUrl');
  @override
  late final GeneratedColumn<String> headerImageUrl = GeneratedColumn<String>(
      'header_image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previewMeta =
      const VerificationMeta('preview');
  @override
  late final GeneratedColumn<String> preview = GeneratedColumn<String>(
      'preview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, artistNames, title, headerImageUrl, type, preview];
  @override
  String get aliasedName => _alias ?? 'recently_played_songs';
  @override
  String get actualTableName => 'recently_played_songs';
  @override
  VerificationContext validateIntegrity(Insertable<RecentlyPlayedSong> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('artist_names')) {
      context.handle(
          _artistNamesMeta,
          artistNames.isAcceptableOrUnknown(
              data['artist_names']!, _artistNamesMeta));
    } else if (isInserting) {
      context.missing(_artistNamesMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('header_image_url')) {
      context.handle(
          _headerImageUrlMeta,
          headerImageUrl.isAcceptableOrUnknown(
              data['header_image_url']!, _headerImageUrlMeta));
    } else if (isInserting) {
      context.missing(_headerImageUrlMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('preview')) {
      context.handle(_previewMeta,
          preview.isAcceptableOrUnknown(data['preview']!, _previewMeta));
    } else if (isInserting) {
      context.missing(_previewMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecentlyPlayedSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentlyPlayedSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      artistNames: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist_names'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      headerImageUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}header_image_url'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      preview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preview'])!,
    );
  }

  @override
  $RecentlyPlayedSongsTable createAlias(String alias) {
    return $RecentlyPlayedSongsTable(attachedDatabase, alias);
  }
}

class RecentlyPlayedSong extends DataClass
    implements Insertable<RecentlyPlayedSong> {
  final int id;
  final String artistNames;
  final String title;
  final String headerImageUrl;
  final String type;
  final String preview;
  const RecentlyPlayedSong(
      {required this.id,
      required this.artistNames,
      required this.title,
      required this.headerImageUrl,
      required this.type,
      required this.preview});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['artist_names'] = Variable<String>(artistNames);
    map['title'] = Variable<String>(title);
    map['header_image_url'] = Variable<String>(headerImageUrl);
    map['type'] = Variable<String>(type);
    map['preview'] = Variable<String>(preview);
    return map;
  }

  RecentlyPlayedSongsCompanion toCompanion(bool nullToAbsent) {
    return RecentlyPlayedSongsCompanion(
      id: Value(id),
      artistNames: Value(artistNames),
      title: Value(title),
      headerImageUrl: Value(headerImageUrl),
      type: Value(type),
      preview: Value(preview),
    );
  }

  factory RecentlyPlayedSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentlyPlayedSong(
      id: serializer.fromJson<int>(json['id']),
      artistNames: serializer.fromJson<String>(json['artistNames']),
      title: serializer.fromJson<String>(json['title']),
      headerImageUrl: serializer.fromJson<String>(json['headerImageUrl']),
      type: serializer.fromJson<String>(json['type']),
      preview: serializer.fromJson<String>(json['preview']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'artistNames': serializer.toJson<String>(artistNames),
      'title': serializer.toJson<String>(title),
      'headerImageUrl': serializer.toJson<String>(headerImageUrl),
      'type': serializer.toJson<String>(type),
      'preview': serializer.toJson<String>(preview),
    };
  }

  RecentlyPlayedSong copyWith(
          {int? id,
          String? artistNames,
          String? title,
          String? headerImageUrl,
          String? type,
          String? preview}) =>
      RecentlyPlayedSong(
        id: id ?? this.id,
        artistNames: artistNames ?? this.artistNames,
        title: title ?? this.title,
        headerImageUrl: headerImageUrl ?? this.headerImageUrl,
        type: type ?? this.type,
        preview: preview ?? this.preview,
      );
  @override
  String toString() {
    return (StringBuffer('RecentlyPlayedSong(')
          ..write('id: $id, ')
          ..write('artistNames: $artistNames, ')
          ..write('title: $title, ')
          ..write('headerImageUrl: $headerImageUrl, ')
          ..write('type: $type, ')
          ..write('preview: $preview')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, artistNames, title, headerImageUrl, type, preview);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentlyPlayedSong &&
          other.id == this.id &&
          other.artistNames == this.artistNames &&
          other.title == this.title &&
          other.headerImageUrl == this.headerImageUrl &&
          other.type == this.type &&
          other.preview == this.preview);
}

class RecentlyPlayedSongsCompanion extends UpdateCompanion<RecentlyPlayedSong> {
  final Value<int> id;
  final Value<String> artistNames;
  final Value<String> title;
  final Value<String> headerImageUrl;
  final Value<String> type;
  final Value<String> preview;
  const RecentlyPlayedSongsCompanion({
    this.id = const Value.absent(),
    this.artistNames = const Value.absent(),
    this.title = const Value.absent(),
    this.headerImageUrl = const Value.absent(),
    this.type = const Value.absent(),
    this.preview = const Value.absent(),
  });
  RecentlyPlayedSongsCompanion.insert({
    this.id = const Value.absent(),
    required String artistNames,
    required String title,
    required String headerImageUrl,
    required String type,
    required String preview,
  })  : artistNames = Value(artistNames),
        title = Value(title),
        headerImageUrl = Value(headerImageUrl),
        type = Value(type),
        preview = Value(preview);
  static Insertable<RecentlyPlayedSong> custom({
    Expression<int>? id,
    Expression<String>? artistNames,
    Expression<String>? title,
    Expression<String>? headerImageUrl,
    Expression<String>? type,
    Expression<String>? preview,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (artistNames != null) 'artist_names': artistNames,
      if (title != null) 'title': title,
      if (headerImageUrl != null) 'header_image_url': headerImageUrl,
      if (type != null) 'type': type,
      if (preview != null) 'preview': preview,
    });
  }

  RecentlyPlayedSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? artistNames,
      Value<String>? title,
      Value<String>? headerImageUrl,
      Value<String>? type,
      Value<String>? preview}) {
    return RecentlyPlayedSongsCompanion(
      id: id ?? this.id,
      artistNames: artistNames ?? this.artistNames,
      title: title ?? this.title,
      headerImageUrl: headerImageUrl ?? this.headerImageUrl,
      type: type ?? this.type,
      preview: preview ?? this.preview,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (artistNames.present) {
      map['artist_names'] = Variable<String>(artistNames.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (headerImageUrl.present) {
      map['header_image_url'] = Variable<String>(headerImageUrl.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (preview.present) {
      map['preview'] = Variable<String>(preview.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentlyPlayedSongsCompanion(')
          ..write('id: $id, ')
          ..write('artistNames: $artistNames, ')
          ..write('title: $title, ')
          ..write('headerImageUrl: $headerImageUrl, ')
          ..write('type: $type, ')
          ..write('preview: $preview')
          ..write(')'))
        .toString();
  }
}

class $FavoriteArtistsTable extends FavoriteArtists
    with TableInfo<$FavoriteArtistsTable, FavoriteArtist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteArtistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, image];
  @override
  String get aliasedName => _alias ?? 'favorite_artists';
  @override
  String get actualTableName => 'favorite_artists';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteArtist> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteArtist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteArtist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $FavoriteArtistsTable createAlias(String alias) {
    return $FavoriteArtistsTable(attachedDatabase, alias);
  }
}

class FavoriteArtist extends DataClass implements Insertable<FavoriteArtist> {
  final int id;
  final String name;
  final String image;
  const FavoriteArtist(
      {required this.id, required this.name, required this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    return map;
  }

  FavoriteArtistsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteArtistsCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
    );
  }

  factory FavoriteArtist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteArtist(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
    };
  }

  FavoriteArtist copyWith({int? id, String? name, String? image}) =>
      FavoriteArtist(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteArtist(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteArtist &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image);
}

class FavoriteArtistsCompanion extends UpdateCompanion<FavoriteArtist> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  const FavoriteArtistsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
  });
  FavoriteArtistsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
  })  : name = Value(name),
        image = Value(image);
  static Insertable<FavoriteArtist> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
    });
  }

  FavoriteArtistsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? image}) {
    return FavoriteArtistsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteArtistsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $BestAlbumsTable extends BestAlbums
    with TableInfo<$BestAlbumsTable, BestAlbum> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BestAlbumsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailAlbumMeta =
      const VerificationMeta('detailAlbum');
  @override
  late final GeneratedColumn<int> detailAlbum = GeneratedColumn<int>(
      'detail_album', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, image, artist, type, detailAlbum];
  @override
  String get aliasedName => _alias ?? 'best_albums';
  @override
  String get actualTableName => 'best_albums';
  @override
  VerificationContext validateIntegrity(Insertable<BestAlbum> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('detail_album')) {
      context.handle(
          _detailAlbumMeta,
          detailAlbum.isAcceptableOrUnknown(
              data['detail_album']!, _detailAlbumMeta));
    } else if (isInserting) {
      context.missing(_detailAlbumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BestAlbum map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BestAlbum(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      detailAlbum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}detail_album'])!,
    );
  }

  @override
  $BestAlbumsTable createAlias(String alias) {
    return $BestAlbumsTable(attachedDatabase, alias);
  }
}

class BestAlbum extends DataClass implements Insertable<BestAlbum> {
  final int id;
  final String title;
  final String image;
  final String artist;
  final String type;
  final int detailAlbum;
  const BestAlbum(
      {required this.id,
      required this.title,
      required this.image,
      required this.artist,
      required this.type,
      required this.detailAlbum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['artist'] = Variable<String>(artist);
    map['type'] = Variable<String>(type);
    map['detail_album'] = Variable<int>(detailAlbum);
    return map;
  }

  BestAlbumsCompanion toCompanion(bool nullToAbsent) {
    return BestAlbumsCompanion(
      id: Value(id),
      title: Value(title),
      image: Value(image),
      artist: Value(artist),
      type: Value(type),
      detailAlbum: Value(detailAlbum),
    );
  }

  factory BestAlbum.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BestAlbum(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      artist: serializer.fromJson<String>(json['artist']),
      type: serializer.fromJson<String>(json['type']),
      detailAlbum: serializer.fromJson<int>(json['detailAlbum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'artist': serializer.toJson<String>(artist),
      'type': serializer.toJson<String>(type),
      'detailAlbum': serializer.toJson<int>(detailAlbum),
    };
  }

  BestAlbum copyWith(
          {int? id,
          String? title,
          String? image,
          String? artist,
          String? type,
          int? detailAlbum}) =>
      BestAlbum(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        artist: artist ?? this.artist,
        type: type ?? this.type,
        detailAlbum: detailAlbum ?? this.detailAlbum,
      );
  @override
  String toString() {
    return (StringBuffer('BestAlbum(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('artist: $artist, ')
          ..write('type: $type, ')
          ..write('detailAlbum: $detailAlbum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, image, artist, type, detailAlbum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BestAlbum &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.artist == this.artist &&
          other.type == this.type &&
          other.detailAlbum == this.detailAlbum);
}

class BestAlbumsCompanion extends UpdateCompanion<BestAlbum> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> image;
  final Value<String> artist;
  final Value<String> type;
  final Value<int> detailAlbum;
  const BestAlbumsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.artist = const Value.absent(),
    this.type = const Value.absent(),
    this.detailAlbum = const Value.absent(),
  });
  BestAlbumsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String image,
    required String artist,
    required String type,
    required int detailAlbum,
  })  : title = Value(title),
        image = Value(image),
        artist = Value(artist),
        type = Value(type),
        detailAlbum = Value(detailAlbum);
  static Insertable<BestAlbum> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? image,
    Expression<String>? artist,
    Expression<String>? type,
    Expression<int>? detailAlbum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (artist != null) 'artist': artist,
      if (type != null) 'type': type,
      if (detailAlbum != null) 'detail_album': detailAlbum,
    });
  }

  BestAlbumsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? image,
      Value<String>? artist,
      Value<String>? type,
      Value<int>? detailAlbum}) {
    return BestAlbumsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      artist: artist ?? this.artist,
      type: type ?? this.type,
      detailAlbum: detailAlbum ?? this.detailAlbum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (detailAlbum.present) {
      map['detail_album'] = Variable<int>(detailAlbum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BestAlbumsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('artist: $artist, ')
          ..write('type: $type, ')
          ..write('detailAlbum: $detailAlbum')
          ..write(')'))
        .toString();
  }
}

class $DetailAlbumsTable extends DetailAlbums
    with TableInfo<$DetailAlbumsTable, DetailAlbum> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetailAlbumsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _albumidMeta =
      const VerificationMeta('albumid');
  @override
  late final GeneratedColumn<int> albumid = GeneratedColumn<int>(
      'albumid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _artistNamesMeta =
      const VerificationMeta('artistNames');
  @override
  late final GeneratedColumn<String> artistNames = GeneratedColumn<String>(
      'artist_names', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previewMeta =
      const VerificationMeta('preview');
  @override
  late final GeneratedColumn<String> preview = GeneratedColumn<String>(
      'preview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, albumid, artistNames, type, preview, title];
  @override
  String get aliasedName => _alias ?? 'detail_albums';
  @override
  String get actualTableName => 'detail_albums';
  @override
  VerificationContext validateIntegrity(Insertable<DetailAlbum> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('albumid')) {
      context.handle(_albumidMeta,
          albumid.isAcceptableOrUnknown(data['albumid']!, _albumidMeta));
    } else if (isInserting) {
      context.missing(_albumidMeta);
    }
    if (data.containsKey('artist_names')) {
      context.handle(
          _artistNamesMeta,
          artistNames.isAcceptableOrUnknown(
              data['artist_names']!, _artistNamesMeta));
    } else if (isInserting) {
      context.missing(_artistNamesMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('preview')) {
      context.handle(_previewMeta,
          preview.isAcceptableOrUnknown(data['preview']!, _previewMeta));
    } else if (isInserting) {
      context.missing(_previewMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DetailAlbum map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetailAlbum(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      albumid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}albumid'])!,
      artistNames: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist_names'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      preview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preview'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $DetailAlbumsTable createAlias(String alias) {
    return $DetailAlbumsTable(attachedDatabase, alias);
  }
}

class DetailAlbum extends DataClass implements Insertable<DetailAlbum> {
  final int id;
  final int albumid;
  final String artistNames;
  final String type;
  final String preview;
  final String title;
  const DetailAlbum(
      {required this.id,
      required this.albumid,
      required this.artistNames,
      required this.type,
      required this.preview,
      required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['albumid'] = Variable<int>(albumid);
    map['artist_names'] = Variable<String>(artistNames);
    map['type'] = Variable<String>(type);
    map['preview'] = Variable<String>(preview);
    map['title'] = Variable<String>(title);
    return map;
  }

  DetailAlbumsCompanion toCompanion(bool nullToAbsent) {
    return DetailAlbumsCompanion(
      id: Value(id),
      albumid: Value(albumid),
      artistNames: Value(artistNames),
      type: Value(type),
      preview: Value(preview),
      title: Value(title),
    );
  }

  factory DetailAlbum.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetailAlbum(
      id: serializer.fromJson<int>(json['id']),
      albumid: serializer.fromJson<int>(json['albumid']),
      artistNames: serializer.fromJson<String>(json['artistNames']),
      type: serializer.fromJson<String>(json['type']),
      preview: serializer.fromJson<String>(json['preview']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'albumid': serializer.toJson<int>(albumid),
      'artistNames': serializer.toJson<String>(artistNames),
      'type': serializer.toJson<String>(type),
      'preview': serializer.toJson<String>(preview),
      'title': serializer.toJson<String>(title),
    };
  }

  DetailAlbum copyWith(
          {int? id,
          int? albumid,
          String? artistNames,
          String? type,
          String? preview,
          String? title}) =>
      DetailAlbum(
        id: id ?? this.id,
        albumid: albumid ?? this.albumid,
        artistNames: artistNames ?? this.artistNames,
        type: type ?? this.type,
        preview: preview ?? this.preview,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('DetailAlbum(')
          ..write('id: $id, ')
          ..write('albumid: $albumid, ')
          ..write('artistNames: $artistNames, ')
          ..write('type: $type, ')
          ..write('preview: $preview, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, albumid, artistNames, type, preview, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailAlbum &&
          other.id == this.id &&
          other.albumid == this.albumid &&
          other.artistNames == this.artistNames &&
          other.type == this.type &&
          other.preview == this.preview &&
          other.title == this.title);
}

class DetailAlbumsCompanion extends UpdateCompanion<DetailAlbum> {
  final Value<int> id;
  final Value<int> albumid;
  final Value<String> artistNames;
  final Value<String> type;
  final Value<String> preview;
  final Value<String> title;
  const DetailAlbumsCompanion({
    this.id = const Value.absent(),
    this.albumid = const Value.absent(),
    this.artistNames = const Value.absent(),
    this.type = const Value.absent(),
    this.preview = const Value.absent(),
    this.title = const Value.absent(),
  });
  DetailAlbumsCompanion.insert({
    this.id = const Value.absent(),
    required int albumid,
    required String artistNames,
    required String type,
    required String preview,
    required String title,
  })  : albumid = Value(albumid),
        artistNames = Value(artistNames),
        type = Value(type),
        preview = Value(preview),
        title = Value(title);
  static Insertable<DetailAlbum> custom({
    Expression<int>? id,
    Expression<int>? albumid,
    Expression<String>? artistNames,
    Expression<String>? type,
    Expression<String>? preview,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (albumid != null) 'albumid': albumid,
      if (artistNames != null) 'artist_names': artistNames,
      if (type != null) 'type': type,
      if (preview != null) 'preview': preview,
      if (title != null) 'title': title,
    });
  }

  DetailAlbumsCompanion copyWith(
      {Value<int>? id,
      Value<int>? albumid,
      Value<String>? artistNames,
      Value<String>? type,
      Value<String>? preview,
      Value<String>? title}) {
    return DetailAlbumsCompanion(
      id: id ?? this.id,
      albumid: albumid ?? this.albumid,
      artistNames: artistNames ?? this.artistNames,
      type: type ?? this.type,
      preview: preview ?? this.preview,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (albumid.present) {
      map['albumid'] = Variable<int>(albumid.value);
    }
    if (artistNames.present) {
      map['artist_names'] = Variable<String>(artistNames.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (preview.present) {
      map['preview'] = Variable<String>(preview.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetailAlbumsCompanion(')
          ..write('id: $id, ')
          ..write('albumid: $albumid, ')
          ..write('artistNames: $artistNames, ')
          ..write('type: $type, ')
          ..write('preview: $preview, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $FavoriteAlbumsTable extends FavoriteAlbums
    with TableInfo<$FavoriteAlbumsTable, FavoriteAlbum> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteAlbumsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _songImageMeta =
      const VerificationMeta('songImage');
  @override
  late final GeneratedColumn<String> songImage = GeneratedColumn<String>(
      'song_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previewMeta =
      const VerificationMeta('preview');
  @override
  late final GeneratedColumn<String> preview = GeneratedColumn<String>(
      'preview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, artist, songImage, type, preview];
  @override
  String get aliasedName => _alias ?? 'favorite_albums';
  @override
  String get actualTableName => 'favorite_albums';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteAlbum> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('song_image')) {
      context.handle(_songImageMeta,
          songImage.isAcceptableOrUnknown(data['song_image']!, _songImageMeta));
    } else if (isInserting) {
      context.missing(_songImageMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('preview')) {
      context.handle(_previewMeta,
          preview.isAcceptableOrUnknown(data['preview']!, _previewMeta));
    } else if (isInserting) {
      context.missing(_previewMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteAlbum map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteAlbum(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist'])!,
      songImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_image'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      preview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preview'])!,
    );
  }

  @override
  $FavoriteAlbumsTable createAlias(String alias) {
    return $FavoriteAlbumsTable(attachedDatabase, alias);
  }
}

class FavoriteAlbum extends DataClass implements Insertable<FavoriteAlbum> {
  final int id;
  final String title;
  final String artist;
  final String songImage;
  final String type;
  final String preview;
  const FavoriteAlbum(
      {required this.id,
      required this.title,
      required this.artist,
      required this.songImage,
      required this.type,
      required this.preview});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['song_image'] = Variable<String>(songImage);
    map['type'] = Variable<String>(type);
    map['preview'] = Variable<String>(preview);
    return map;
  }

  FavoriteAlbumsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteAlbumsCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      songImage: Value(songImage),
      type: Value(type),
      preview: Value(preview),
    );
  }

  factory FavoriteAlbum.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteAlbum(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      songImage: serializer.fromJson<String>(json['songImage']),
      type: serializer.fromJson<String>(json['type']),
      preview: serializer.fromJson<String>(json['preview']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'songImage': serializer.toJson<String>(songImage),
      'type': serializer.toJson<String>(type),
      'preview': serializer.toJson<String>(preview),
    };
  }

  FavoriteAlbum copyWith(
          {int? id,
          String? title,
          String? artist,
          String? songImage,
          String? type,
          String? preview}) =>
      FavoriteAlbum(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        songImage: songImage ?? this.songImage,
        type: type ?? this.type,
        preview: preview ?? this.preview,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteAlbum(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage, ')
          ..write('type: $type, ')
          ..write('preview: $preview')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, artist, songImage, type, preview);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteAlbum &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.songImage == this.songImage &&
          other.type == this.type &&
          other.preview == this.preview);
}

class FavoriteAlbumsCompanion extends UpdateCompanion<FavoriteAlbum> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> songImage;
  final Value<String> type;
  final Value<String> preview;
  const FavoriteAlbumsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.songImage = const Value.absent(),
    this.type = const Value.absent(),
    this.preview = const Value.absent(),
  });
  FavoriteAlbumsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String artist,
    required String songImage,
    required String type,
    required String preview,
  })  : title = Value(title),
        artist = Value(artist),
        songImage = Value(songImage),
        type = Value(type),
        preview = Value(preview);
  static Insertable<FavoriteAlbum> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? songImage,
    Expression<String>? type,
    Expression<String>? preview,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (songImage != null) 'song_image': songImage,
      if (type != null) 'type': type,
      if (preview != null) 'preview': preview,
    });
  }

  FavoriteAlbumsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? artist,
      Value<String>? songImage,
      Value<String>? type,
      Value<String>? preview}) {
    return FavoriteAlbumsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      songImage: songImage ?? this.songImage,
      type: type ?? this.type,
      preview: preview ?? this.preview,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (songImage.present) {
      map['song_image'] = Variable<String>(songImage.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (preview.present) {
      map['preview'] = Variable<String>(preview.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteAlbumsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage, ')
          ..write('type: $type, ')
          ..write('preview: $preview')
          ..write(')'))
        .toString();
  }
}

class $FavoriteSongsTable extends FavoriteSongs
    with TableInfo<$FavoriteSongsTable, FavoriteSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _songImageMeta =
      const VerificationMeta('songImage');
  @override
  late final GeneratedColumn<String> songImage = GeneratedColumn<String>(
      'song_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previewMeta =
      const VerificationMeta('preview');
  @override
  late final GeneratedColumn<String> preview = GeneratedColumn<String>(
      'preview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, artist, songImage, type, preview];
  @override
  String get aliasedName => _alias ?? 'favorite_songs';
  @override
  String get actualTableName => 'favorite_songs';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteSong> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('song_image')) {
      context.handle(_songImageMeta,
          songImage.isAcceptableOrUnknown(data['song_image']!, _songImageMeta));
    } else if (isInserting) {
      context.missing(_songImageMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('preview')) {
      context.handle(_previewMeta,
          preview.isAcceptableOrUnknown(data['preview']!, _previewMeta));
    } else if (isInserting) {
      context.missing(_previewMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist'])!,
      songImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_image'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      preview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preview'])!,
    );
  }

  @override
  $FavoriteSongsTable createAlias(String alias) {
    return $FavoriteSongsTable(attachedDatabase, alias);
  }
}

class FavoriteSong extends DataClass implements Insertable<FavoriteSong> {
  final int id;
  final String title;
  final String artist;
  final String songImage;
  final String type;
  final String preview;
  const FavoriteSong(
      {required this.id,
      required this.title,
      required this.artist,
      required this.songImage,
      required this.type,
      required this.preview});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['song_image'] = Variable<String>(songImage);
    map['type'] = Variable<String>(type);
    map['preview'] = Variable<String>(preview);
    return map;
  }

  FavoriteSongsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteSongsCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      songImage: Value(songImage),
      type: Value(type),
      preview: Value(preview),
    );
  }

  factory FavoriteSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteSong(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      songImage: serializer.fromJson<String>(json['songImage']),
      type: serializer.fromJson<String>(json['type']),
      preview: serializer.fromJson<String>(json['preview']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'songImage': serializer.toJson<String>(songImage),
      'type': serializer.toJson<String>(type),
      'preview': serializer.toJson<String>(preview),
    };
  }

  FavoriteSong copyWith(
          {int? id,
          String? title,
          String? artist,
          String? songImage,
          String? type,
          String? preview}) =>
      FavoriteSong(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        songImage: songImage ?? this.songImage,
        type: type ?? this.type,
        preview: preview ?? this.preview,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteSong(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage, ')
          ..write('type: $type, ')
          ..write('preview: $preview')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, artist, songImage, type, preview);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteSong &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.songImage == this.songImage &&
          other.type == this.type &&
          other.preview == this.preview);
}

class FavoriteSongsCompanion extends UpdateCompanion<FavoriteSong> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> songImage;
  final Value<String> type;
  final Value<String> preview;
  const FavoriteSongsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.songImage = const Value.absent(),
    this.type = const Value.absent(),
    this.preview = const Value.absent(),
  });
  FavoriteSongsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String artist,
    required String songImage,
    required String type,
    required String preview,
  })  : title = Value(title),
        artist = Value(artist),
        songImage = Value(songImage),
        type = Value(type),
        preview = Value(preview);
  static Insertable<FavoriteSong> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? songImage,
    Expression<String>? type,
    Expression<String>? preview,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (songImage != null) 'song_image': songImage,
      if (type != null) 'type': type,
      if (preview != null) 'preview': preview,
    });
  }

  FavoriteSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? artist,
      Value<String>? songImage,
      Value<String>? type,
      Value<String>? preview}) {
    return FavoriteSongsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      songImage: songImage ?? this.songImage,
      type: type ?? this.type,
      preview: preview ?? this.preview,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (songImage.present) {
      map['song_image'] = Variable<String>(songImage.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (preview.present) {
      map['preview'] = Variable<String>(preview.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteSongsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage, ')
          ..write('type: $type, ')
          ..write('preview: $preview')
          ..write(')'))
        .toString();
  }
}

class $RecentlySearchedSongsTable extends RecentlySearchedSongs
    with TableInfo<$RecentlySearchedSongsTable, RecentlySearchedSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentlySearchedSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _songImageMeta =
      const VerificationMeta('songImage');
  @override
  late final GeneratedColumn<String> songImage = GeneratedColumn<String>(
      'song_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previewMeta =
      const VerificationMeta('preview');
  @override
  late final GeneratedColumn<String> preview = GeneratedColumn<String>(
      'preview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, artist, type, songImage, preview];
  @override
  String get aliasedName => _alias ?? 'recently_searched_songs';
  @override
  String get actualTableName => 'recently_searched_songs';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecentlySearchedSong> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('song_image')) {
      context.handle(_songImageMeta,
          songImage.isAcceptableOrUnknown(data['song_image']!, _songImageMeta));
    } else if (isInserting) {
      context.missing(_songImageMeta);
    }
    if (data.containsKey('preview')) {
      context.handle(_previewMeta,
          preview.isAcceptableOrUnknown(data['preview']!, _previewMeta));
    } else if (isInserting) {
      context.missing(_previewMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecentlySearchedSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentlySearchedSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      songImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_image'])!,
      preview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preview'])!,
    );
  }

  @override
  $RecentlySearchedSongsTable createAlias(String alias) {
    return $RecentlySearchedSongsTable(attachedDatabase, alias);
  }
}

class RecentlySearchedSong extends DataClass
    implements Insertable<RecentlySearchedSong> {
  final int id;
  final String title;
  final String artist;
  final String type;
  final String songImage;
  final String preview;
  const RecentlySearchedSong(
      {required this.id,
      required this.title,
      required this.artist,
      required this.type,
      required this.songImage,
      required this.preview});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['type'] = Variable<String>(type);
    map['song_image'] = Variable<String>(songImage);
    map['preview'] = Variable<String>(preview);
    return map;
  }

  RecentlySearchedSongsCompanion toCompanion(bool nullToAbsent) {
    return RecentlySearchedSongsCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      type: Value(type),
      songImage: Value(songImage),
      preview: Value(preview),
    );
  }

  factory RecentlySearchedSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentlySearchedSong(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      type: serializer.fromJson<String>(json['type']),
      songImage: serializer.fromJson<String>(json['songImage']),
      preview: serializer.fromJson<String>(json['preview']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'type': serializer.toJson<String>(type),
      'songImage': serializer.toJson<String>(songImage),
      'preview': serializer.toJson<String>(preview),
    };
  }

  RecentlySearchedSong copyWith(
          {int? id,
          String? title,
          String? artist,
          String? type,
          String? songImage,
          String? preview}) =>
      RecentlySearchedSong(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        type: type ?? this.type,
        songImage: songImage ?? this.songImage,
        preview: preview ?? this.preview,
      );
  @override
  String toString() {
    return (StringBuffer('RecentlySearchedSong(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('type: $type, ')
          ..write('songImage: $songImage, ')
          ..write('preview: $preview')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, artist, type, songImage, preview);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentlySearchedSong &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.type == this.type &&
          other.songImage == this.songImage &&
          other.preview == this.preview);
}

class RecentlySearchedSongsCompanion
    extends UpdateCompanion<RecentlySearchedSong> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> type;
  final Value<String> songImage;
  final Value<String> preview;
  const RecentlySearchedSongsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.type = const Value.absent(),
    this.songImage = const Value.absent(),
    this.preview = const Value.absent(),
  });
  RecentlySearchedSongsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String artist,
    required String type,
    required String songImage,
    required String preview,
  })  : title = Value(title),
        artist = Value(artist),
        type = Value(type),
        songImage = Value(songImage),
        preview = Value(preview);
  static Insertable<RecentlySearchedSong> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? type,
    Expression<String>? songImage,
    Expression<String>? preview,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (type != null) 'type': type,
      if (songImage != null) 'song_image': songImage,
      if (preview != null) 'preview': preview,
    });
  }

  RecentlySearchedSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? artist,
      Value<String>? type,
      Value<String>? songImage,
      Value<String>? preview}) {
    return RecentlySearchedSongsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      type: type ?? this.type,
      songImage: songImage ?? this.songImage,
      preview: preview ?? this.preview,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (songImage.present) {
      map['song_image'] = Variable<String>(songImage.value);
    }
    if (preview.present) {
      map['preview'] = Variable<String>(preview.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentlySearchedSongsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('type: $type, ')
          ..write('songImage: $songImage, ')
          ..write('preview: $preview')
          ..write(')'))
        .toString();
  }
}

class $DetailInfoSongsTable extends DetailInfoSongs
    with TableInfo<$DetailInfoSongsTable, DetailInfoSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetailInfoSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artistNamesMeta =
      const VerificationMeta('artistNames');
  @override
  late final GeneratedColumn<String> artistNames = GeneratedColumn<String>(
      'artist_names', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previewMeta =
      const VerificationMeta('preview');
  @override
  late final GeneratedColumn<String> preview = GeneratedColumn<String>(
      'preview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, artistNames, imageUrl, preview, type];
  @override
  String get aliasedName => _alias ?? 'detail_info_songs';
  @override
  String get actualTableName => 'detail_info_songs';
  @override
  VerificationContext validateIntegrity(Insertable<DetailInfoSong> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist_names')) {
      context.handle(
          _artistNamesMeta,
          artistNames.isAcceptableOrUnknown(
              data['artist_names']!, _artistNamesMeta));
    } else if (isInserting) {
      context.missing(_artistNamesMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('preview')) {
      context.handle(_previewMeta,
          preview.isAcceptableOrUnknown(data['preview']!, _previewMeta));
    } else if (isInserting) {
      context.missing(_previewMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DetailInfoSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetailInfoSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      artistNames: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist_names'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      preview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preview'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $DetailInfoSongsTable createAlias(String alias) {
    return $DetailInfoSongsTable(attachedDatabase, alias);
  }
}

class DetailInfoSong extends DataClass implements Insertable<DetailInfoSong> {
  final int id;
  final String title;
  final String artistNames;
  final String imageUrl;
  final String preview;
  final String type;
  const DetailInfoSong(
      {required this.id,
      required this.title,
      required this.artistNames,
      required this.imageUrl,
      required this.preview,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['artist_names'] = Variable<String>(artistNames);
    map['image_url'] = Variable<String>(imageUrl);
    map['preview'] = Variable<String>(preview);
    map['type'] = Variable<String>(type);
    return map;
  }

  DetailInfoSongsCompanion toCompanion(bool nullToAbsent) {
    return DetailInfoSongsCompanion(
      id: Value(id),
      title: Value(title),
      artistNames: Value(artistNames),
      imageUrl: Value(imageUrl),
      preview: Value(preview),
      type: Value(type),
    );
  }

  factory DetailInfoSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetailInfoSong(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artistNames: serializer.fromJson<String>(json['artistNames']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      preview: serializer.fromJson<String>(json['preview']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'artistNames': serializer.toJson<String>(artistNames),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'preview': serializer.toJson<String>(preview),
      'type': serializer.toJson<String>(type),
    };
  }

  DetailInfoSong copyWith(
          {int? id,
          String? title,
          String? artistNames,
          String? imageUrl,
          String? preview,
          String? type}) =>
      DetailInfoSong(
        id: id ?? this.id,
        title: title ?? this.title,
        artistNames: artistNames ?? this.artistNames,
        imageUrl: imageUrl ?? this.imageUrl,
        preview: preview ?? this.preview,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('DetailInfoSong(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artistNames: $artistNames, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('preview: $preview, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, artistNames, imageUrl, preview, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailInfoSong &&
          other.id == this.id &&
          other.title == this.title &&
          other.artistNames == this.artistNames &&
          other.imageUrl == this.imageUrl &&
          other.preview == this.preview &&
          other.type == this.type);
}

class DetailInfoSongsCompanion extends UpdateCompanion<DetailInfoSong> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> artistNames;
  final Value<String> imageUrl;
  final Value<String> preview;
  final Value<String> type;
  const DetailInfoSongsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artistNames = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.preview = const Value.absent(),
    this.type = const Value.absent(),
  });
  DetailInfoSongsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String artistNames,
    required String imageUrl,
    required String preview,
    required String type,
  })  : title = Value(title),
        artistNames = Value(artistNames),
        imageUrl = Value(imageUrl),
        preview = Value(preview),
        type = Value(type);
  static Insertable<DetailInfoSong> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? artistNames,
    Expression<String>? imageUrl,
    Expression<String>? preview,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artistNames != null) 'artist_names': artistNames,
      if (imageUrl != null) 'image_url': imageUrl,
      if (preview != null) 'preview': preview,
      if (type != null) 'type': type,
    });
  }

  DetailInfoSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? artistNames,
      Value<String>? imageUrl,
      Value<String>? preview,
      Value<String>? type}) {
    return DetailInfoSongsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artistNames: artistNames ?? this.artistNames,
      imageUrl: imageUrl ?? this.imageUrl,
      preview: preview ?? this.preview,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artistNames.present) {
      map['artist_names'] = Variable<String>(artistNames.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (preview.present) {
      map['preview'] = Variable<String>(preview.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetailInfoSongsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artistNames: $artistNames, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('preview: $preview, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $MusicGenresTable extends MusicGenres
    with TableInfo<$MusicGenresTable, MusicGenre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MusicGenresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, image];
  @override
  String get aliasedName => _alias ?? 'music_genres';
  @override
  String get actualTableName => 'music_genres';
  @override
  VerificationContext validateIntegrity(Insertable<MusicGenre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MusicGenre map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MusicGenre(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $MusicGenresTable createAlias(String alias) {
    return $MusicGenresTable(attachedDatabase, alias);
  }
}

class MusicGenre extends DataClass implements Insertable<MusicGenre> {
  final String id;
  final String name;
  final String image;
  const MusicGenre({required this.id, required this.name, required this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    return map;
  }

  MusicGenresCompanion toCompanion(bool nullToAbsent) {
    return MusicGenresCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
    );
  }

  factory MusicGenre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MusicGenre(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
    };
  }

  MusicGenre copyWith({String? id, String? name, String? image}) => MusicGenre(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('MusicGenre(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MusicGenre &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image);
}

class MusicGenresCompanion extends UpdateCompanion<MusicGenre> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> image;
  final Value<int> rowid;
  const MusicGenresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MusicGenresCompanion.insert({
    required String id,
    required String name,
    required String image,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        image = Value(image);
  static Insertable<MusicGenre> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MusicGenresCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? image,
      Value<int>? rowid}) {
    return MusicGenresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MusicGenresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MyMusicFoldersTable extends MyMusicFolders
    with TableInfo<$MyMusicFoldersTable, MyMusicFolder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyMusicFoldersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, image];
  @override
  String get aliasedName => _alias ?? 'my_music_folders';
  @override
  String get actualTableName => 'my_music_folders';
  @override
  VerificationContext validateIntegrity(Insertable<MyMusicFolder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  MyMusicFolder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyMusicFolder(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $MyMusicFoldersTable createAlias(String alias) {
    return $MyMusicFoldersTable(attachedDatabase, alias);
  }
}

class MyMusicFolder extends DataClass implements Insertable<MyMusicFolder> {
  final String name;
  final String image;
  const MyMusicFolder({required this.name, required this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    return map;
  }

  MyMusicFoldersCompanion toCompanion(bool nullToAbsent) {
    return MyMusicFoldersCompanion(
      name: Value(name),
      image: Value(image),
    );
  }

  factory MyMusicFolder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyMusicFolder(
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
    };
  }

  MyMusicFolder copyWith({String? name, String? image}) => MyMusicFolder(
        name: name ?? this.name,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('MyMusicFolder(')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyMusicFolder &&
          other.name == this.name &&
          other.image == this.image);
}

class MyMusicFoldersCompanion extends UpdateCompanion<MyMusicFolder> {
  final Value<String> name;
  final Value<String> image;
  final Value<int> rowid;
  const MyMusicFoldersCompanion({
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MyMusicFoldersCompanion.insert({
    required String name,
    required String image,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        image = Value(image);
  static Insertable<MyMusicFolder> custom({
    Expression<String>? name,
    Expression<String>? image,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MyMusicFoldersCompanion copyWith(
      {Value<String>? name, Value<String>? image, Value<int>? rowid}) {
    return MyMusicFoldersCompanion(
      name: name ?? this.name,
      image: image ?? this.image,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyMusicFoldersCompanion(')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AudioAppDatabase extends GeneratedDatabase {
  _$AudioAppDatabase(QueryExecutor e) : super(e);
  late final $RecentlyPlayedSongsTable recentlyPlayedSongs =
      $RecentlyPlayedSongsTable(this);
  late final $FavoriteArtistsTable favoriteArtists =
      $FavoriteArtistsTable(this);
  late final $BestAlbumsTable bestAlbums = $BestAlbumsTable(this);
  late final $DetailAlbumsTable detailAlbums = $DetailAlbumsTable(this);
  late final $FavoriteAlbumsTable favoriteAlbums = $FavoriteAlbumsTable(this);
  late final $FavoriteSongsTable favoriteSongs = $FavoriteSongsTable(this);
  late final $RecentlySearchedSongsTable recentlySearchedSongs =
      $RecentlySearchedSongsTable(this);
  late final $DetailInfoSongsTable detailInfoSongs =
      $DetailInfoSongsTable(this);
  late final $MusicGenresTable musicGenres = $MusicGenresTable(this);
  late final $MyMusicFoldersTable myMusicFolders = $MyMusicFoldersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        recentlyPlayedSongs,
        favoriteArtists,
        bestAlbums,
        detailAlbums,
        favoriteAlbums,
        favoriteSongs,
        recentlySearchedSongs,
        detailInfoSongs,
        musicGenres,
        myMusicFolders
      ];
}
