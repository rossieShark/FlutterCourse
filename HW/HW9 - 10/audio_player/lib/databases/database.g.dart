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
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, artistNames, title, headerImageUrl];
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
  const RecentlyPlayedSong(
      {required this.id,
      required this.artistNames,
      required this.title,
      required this.headerImageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['artist_names'] = Variable<String>(artistNames);
    map['title'] = Variable<String>(title);
    map['header_image_url'] = Variable<String>(headerImageUrl);
    return map;
  }

  RecentlyPlayedSongsCompanion toCompanion(bool nullToAbsent) {
    return RecentlyPlayedSongsCompanion(
      id: Value(id),
      artistNames: Value(artistNames),
      title: Value(title),
      headerImageUrl: Value(headerImageUrl),
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
    };
  }

  RecentlyPlayedSong copyWith(
          {int? id,
          String? artistNames,
          String? title,
          String? headerImageUrl}) =>
      RecentlyPlayedSong(
        id: id ?? this.id,
        artistNames: artistNames ?? this.artistNames,
        title: title ?? this.title,
        headerImageUrl: headerImageUrl ?? this.headerImageUrl,
      );
  @override
  String toString() {
    return (StringBuffer('RecentlyPlayedSong(')
          ..write('id: $id, ')
          ..write('artistNames: $artistNames, ')
          ..write('title: $title, ')
          ..write('headerImageUrl: $headerImageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, artistNames, title, headerImageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentlyPlayedSong &&
          other.id == this.id &&
          other.artistNames == this.artistNames &&
          other.title == this.title &&
          other.headerImageUrl == this.headerImageUrl);
}

class RecentlyPlayedSongsCompanion extends UpdateCompanion<RecentlyPlayedSong> {
  final Value<int> id;
  final Value<String> artistNames;
  final Value<String> title;
  final Value<String> headerImageUrl;
  const RecentlyPlayedSongsCompanion({
    this.id = const Value.absent(),
    this.artistNames = const Value.absent(),
    this.title = const Value.absent(),
    this.headerImageUrl = const Value.absent(),
  });
  RecentlyPlayedSongsCompanion.insert({
    this.id = const Value.absent(),
    required String artistNames,
    required String title,
    required String headerImageUrl,
  })  : artistNames = Value(artistNames),
        title = Value(title),
        headerImageUrl = Value(headerImageUrl);
  static Insertable<RecentlyPlayedSong> custom({
    Expression<int>? id,
    Expression<String>? artistNames,
    Expression<String>? title,
    Expression<String>? headerImageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (artistNames != null) 'artist_names': artistNames,
      if (title != null) 'title': title,
      if (headerImageUrl != null) 'header_image_url': headerImageUrl,
    });
  }

  RecentlyPlayedSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? artistNames,
      Value<String>? title,
      Value<String>? headerImageUrl}) {
    return RecentlyPlayedSongsCompanion(
      id: id ?? this.id,
      artistNames: artistNames ?? this.artistNames,
      title: title ?? this.title,
      headerImageUrl: headerImageUrl ?? this.headerImageUrl,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentlyPlayedSongsCompanion(')
          ..write('id: $id, ')
          ..write('artistNames: $artistNames, ')
          ..write('title: $title, ')
          ..write('headerImageUrl: $headerImageUrl')
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
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => const {};
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
  final Value<int> rowid;
  const FavoriteArtistsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteArtistsCompanion.insert({
    required int id,
    required String name,
    required String image,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        image = Value(image);
  static Insertable<FavoriteArtist> custom({
    Expression<int>? id,
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

  FavoriteArtistsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? image,
      Value<int>? rowid}) {
    return FavoriteArtistsCompanion(
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
      map['id'] = Variable<int>(id.value);
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
    return (StringBuffer('FavoriteArtistsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('rowid: $rowid')
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
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailAlbumMeta =
      const VerificationMeta('detailAlbum');
  @override
  late final GeneratedColumn<int> detailAlbum = GeneratedColumn<int>(
      'detail_album', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, image, releaseDate, detailAlbum];
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
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
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
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
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
  final String releaseDate;
  final int detailAlbum;
  const BestAlbum(
      {required this.id,
      required this.title,
      required this.image,
      required this.releaseDate,
      required this.detailAlbum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['release_date'] = Variable<String>(releaseDate);
    map['detail_album'] = Variable<int>(detailAlbum);
    return map;
  }

  BestAlbumsCompanion toCompanion(bool nullToAbsent) {
    return BestAlbumsCompanion(
      id: Value(id),
      title: Value(title),
      image: Value(image),
      releaseDate: Value(releaseDate),
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
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
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
      'releaseDate': serializer.toJson<String>(releaseDate),
      'detailAlbum': serializer.toJson<int>(detailAlbum),
    };
  }

  BestAlbum copyWith(
          {int? id,
          String? title,
          String? image,
          String? releaseDate,
          int? detailAlbum}) =>
      BestAlbum(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        releaseDate: releaseDate ?? this.releaseDate,
        detailAlbum: detailAlbum ?? this.detailAlbum,
      );
  @override
  String toString() {
    return (StringBuffer('BestAlbum(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('detailAlbum: $detailAlbum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, image, releaseDate, detailAlbum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BestAlbum &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.releaseDate == this.releaseDate &&
          other.detailAlbum == this.detailAlbum);
}

class BestAlbumsCompanion extends UpdateCompanion<BestAlbum> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> image;
  final Value<String> releaseDate;
  final Value<int> detailAlbum;
  const BestAlbumsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.detailAlbum = const Value.absent(),
  });
  BestAlbumsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String image,
    required String releaseDate,
    required int detailAlbum,
  })  : title = Value(title),
        image = Value(image),
        releaseDate = Value(releaseDate),
        detailAlbum = Value(detailAlbum);
  static Insertable<BestAlbum> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? image,
    Expression<String>? releaseDate,
    Expression<int>? detailAlbum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (releaseDate != null) 'release_date': releaseDate,
      if (detailAlbum != null) 'detail_album': detailAlbum,
    });
  }

  BestAlbumsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? image,
      Value<String>? releaseDate,
      Value<int>? detailAlbum}) {
    return BestAlbumsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      releaseDate: releaseDate ?? this.releaseDate,
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
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
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
          ..write('releaseDate: $releaseDate, ')
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
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  static const VerificationMeta _headerImageUrlMeta =
      const VerificationMeta('headerImageUrl');
  @override
  late final GeneratedColumn<String> headerImageUrl = GeneratedColumn<String>(
      'header_image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _songImageMeta =
      const VerificationMeta('songImage');
  @override
  late final GeneratedColumn<String> songImage = GeneratedColumn<String>(
      'song_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, albumid, artistNames, headerImageUrl, title, songImage, releaseDate];
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
    if (data.containsKey('header_image_url')) {
      context.handle(
          _headerImageUrlMeta,
          headerImageUrl.isAcceptableOrUnknown(
              data['header_image_url']!, _headerImageUrlMeta));
    } else if (isInserting) {
      context.missing(_headerImageUrlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('song_image')) {
      context.handle(_songImageMeta,
          songImage.isAcceptableOrUnknown(data['song_image']!, _songImageMeta));
    } else if (isInserting) {
      context.missing(_songImageMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
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
      headerImageUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}header_image_url'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      songImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_image'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
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
  final String headerImageUrl;
  final String title;
  final String songImage;
  final String releaseDate;
  const DetailAlbum(
      {required this.id,
      required this.albumid,
      required this.artistNames,
      required this.headerImageUrl,
      required this.title,
      required this.songImage,
      required this.releaseDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['albumid'] = Variable<int>(albumid);
    map['artist_names'] = Variable<String>(artistNames);
    map['header_image_url'] = Variable<String>(headerImageUrl);
    map['title'] = Variable<String>(title);
    map['song_image'] = Variable<String>(songImage);
    map['release_date'] = Variable<String>(releaseDate);
    return map;
  }

  DetailAlbumsCompanion toCompanion(bool nullToAbsent) {
    return DetailAlbumsCompanion(
      id: Value(id),
      albumid: Value(albumid),
      artistNames: Value(artistNames),
      headerImageUrl: Value(headerImageUrl),
      title: Value(title),
      songImage: Value(songImage),
      releaseDate: Value(releaseDate),
    );
  }

  factory DetailAlbum.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetailAlbum(
      id: serializer.fromJson<int>(json['id']),
      albumid: serializer.fromJson<int>(json['albumid']),
      artistNames: serializer.fromJson<String>(json['artistNames']),
      headerImageUrl: serializer.fromJson<String>(json['headerImageUrl']),
      title: serializer.fromJson<String>(json['title']),
      songImage: serializer.fromJson<String>(json['songImage']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'albumid': serializer.toJson<int>(albumid),
      'artistNames': serializer.toJson<String>(artistNames),
      'headerImageUrl': serializer.toJson<String>(headerImageUrl),
      'title': serializer.toJson<String>(title),
      'songImage': serializer.toJson<String>(songImage),
      'releaseDate': serializer.toJson<String>(releaseDate),
    };
  }

  DetailAlbum copyWith(
          {int? id,
          int? albumid,
          String? artistNames,
          String? headerImageUrl,
          String? title,
          String? songImage,
          String? releaseDate}) =>
      DetailAlbum(
        id: id ?? this.id,
        albumid: albumid ?? this.albumid,
        artistNames: artistNames ?? this.artistNames,
        headerImageUrl: headerImageUrl ?? this.headerImageUrl,
        title: title ?? this.title,
        songImage: songImage ?? this.songImage,
        releaseDate: releaseDate ?? this.releaseDate,
      );
  @override
  String toString() {
    return (StringBuffer('DetailAlbum(')
          ..write('id: $id, ')
          ..write('albumid: $albumid, ')
          ..write('artistNames: $artistNames, ')
          ..write('headerImageUrl: $headerImageUrl, ')
          ..write('title: $title, ')
          ..write('songImage: $songImage, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, albumid, artistNames, headerImageUrl, title, songImage, releaseDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailAlbum &&
          other.id == this.id &&
          other.albumid == this.albumid &&
          other.artistNames == this.artistNames &&
          other.headerImageUrl == this.headerImageUrl &&
          other.title == this.title &&
          other.songImage == this.songImage &&
          other.releaseDate == this.releaseDate);
}

class DetailAlbumsCompanion extends UpdateCompanion<DetailAlbum> {
  final Value<int> id;
  final Value<int> albumid;
  final Value<String> artistNames;
  final Value<String> headerImageUrl;
  final Value<String> title;
  final Value<String> songImage;
  final Value<String> releaseDate;
  const DetailAlbumsCompanion({
    this.id = const Value.absent(),
    this.albumid = const Value.absent(),
    this.artistNames = const Value.absent(),
    this.headerImageUrl = const Value.absent(),
    this.title = const Value.absent(),
    this.songImage = const Value.absent(),
    this.releaseDate = const Value.absent(),
  });
  DetailAlbumsCompanion.insert({
    this.id = const Value.absent(),
    required int albumid,
    required String artistNames,
    required String headerImageUrl,
    required String title,
    required String songImage,
    required String releaseDate,
  })  : albumid = Value(albumid),
        artistNames = Value(artistNames),
        headerImageUrl = Value(headerImageUrl),
        title = Value(title),
        songImage = Value(songImage),
        releaseDate = Value(releaseDate);
  static Insertable<DetailAlbum> custom({
    Expression<int>? id,
    Expression<int>? albumid,
    Expression<String>? artistNames,
    Expression<String>? headerImageUrl,
    Expression<String>? title,
    Expression<String>? songImage,
    Expression<String>? releaseDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (albumid != null) 'albumid': albumid,
      if (artistNames != null) 'artist_names': artistNames,
      if (headerImageUrl != null) 'header_image_url': headerImageUrl,
      if (title != null) 'title': title,
      if (songImage != null) 'song_image': songImage,
      if (releaseDate != null) 'release_date': releaseDate,
    });
  }

  DetailAlbumsCompanion copyWith(
      {Value<int>? id,
      Value<int>? albumid,
      Value<String>? artistNames,
      Value<String>? headerImageUrl,
      Value<String>? title,
      Value<String>? songImage,
      Value<String>? releaseDate}) {
    return DetailAlbumsCompanion(
      id: id ?? this.id,
      albumid: albumid ?? this.albumid,
      artistNames: artistNames ?? this.artistNames,
      headerImageUrl: headerImageUrl ?? this.headerImageUrl,
      title: title ?? this.title,
      songImage: songImage ?? this.songImage,
      releaseDate: releaseDate ?? this.releaseDate,
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
    if (headerImageUrl.present) {
      map['header_image_url'] = Variable<String>(headerImageUrl.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (songImage.present) {
      map['song_image'] = Variable<String>(songImage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetailAlbumsCompanion(')
          ..write('id: $id, ')
          ..write('albumid: $albumid, ')
          ..write('artistNames: $artistNames, ')
          ..write('headerImageUrl: $headerImageUrl, ')
          ..write('title: $title, ')
          ..write('songImage: $songImage, ')
          ..write('releaseDate: $releaseDate')
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
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  @override
  List<GeneratedColumn> get $columns => [id, title, artist, songImage];
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
  const FavoriteAlbum(
      {required this.id,
      required this.title,
      required this.artist,
      required this.songImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['song_image'] = Variable<String>(songImage);
    return map;
  }

  FavoriteAlbumsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteAlbumsCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      songImage: Value(songImage),
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
    };
  }

  FavoriteAlbum copyWith(
          {int? id, String? title, String? artist, String? songImage}) =>
      FavoriteAlbum(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        songImage: songImage ?? this.songImage,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteAlbum(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, artist, songImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteAlbum &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.songImage == this.songImage);
}

class FavoriteAlbumsCompanion extends UpdateCompanion<FavoriteAlbum> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> songImage;
  const FavoriteAlbumsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.songImage = const Value.absent(),
  });
  FavoriteAlbumsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String artist,
    required String songImage,
  })  : title = Value(title),
        artist = Value(artist),
        songImage = Value(songImage);
  static Insertable<FavoriteAlbum> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? songImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (songImage != null) 'song_image': songImage,
    });
  }

  FavoriteAlbumsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? artist,
      Value<String>? songImage}) {
    return FavoriteAlbumsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      songImage: songImage ?? this.songImage,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteAlbumsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage')
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
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  @override
  List<GeneratedColumn> get $columns => [id, title, artist, songImage];
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
  const FavoriteSong(
      {required this.id,
      required this.title,
      required this.artist,
      required this.songImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['song_image'] = Variable<String>(songImage);
    return map;
  }

  FavoriteSongsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteSongsCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      songImage: Value(songImage),
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
    };
  }

  FavoriteSong copyWith(
          {int? id, String? title, String? artist, String? songImage}) =>
      FavoriteSong(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        songImage: songImage ?? this.songImage,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteSong(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, artist, songImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteSong &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.songImage == this.songImage);
}

class FavoriteSongsCompanion extends UpdateCompanion<FavoriteSong> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> songImage;
  const FavoriteSongsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.songImage = const Value.absent(),
  });
  FavoriteSongsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String artist,
    required String songImage,
  })  : title = Value(title),
        artist = Value(artist),
        songImage = Value(songImage);
  static Insertable<FavoriteSong> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? songImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (songImage != null) 'song_image': songImage,
    });
  }

  FavoriteSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? artist,
      Value<String>? songImage}) {
    return FavoriteSongsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      songImage: songImage ?? this.songImage,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteSongsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage')
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
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  @override
  List<GeneratedColumn> get $columns => [id, title, artist, songImage];
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
    if (data.containsKey('song_image')) {
      context.handle(_songImageMeta,
          songImage.isAcceptableOrUnknown(data['song_image']!, _songImageMeta));
    } else if (isInserting) {
      context.missing(_songImageMeta);
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
      songImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_image'])!,
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
  final String songImage;
  const RecentlySearchedSong(
      {required this.id,
      required this.title,
      required this.artist,
      required this.songImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['song_image'] = Variable<String>(songImage);
    return map;
  }

  RecentlySearchedSongsCompanion toCompanion(bool nullToAbsent) {
    return RecentlySearchedSongsCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      songImage: Value(songImage),
    );
  }

  factory RecentlySearchedSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentlySearchedSong(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      songImage: serializer.fromJson<String>(json['songImage']),
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
    };
  }

  RecentlySearchedSong copyWith(
          {int? id, String? title, String? artist, String? songImage}) =>
      RecentlySearchedSong(
        id: id ?? this.id,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        songImage: songImage ?? this.songImage,
      );
  @override
  String toString() {
    return (StringBuffer('RecentlySearchedSong(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, artist, songImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentlySearchedSong &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.songImage == this.songImage);
}

class RecentlySearchedSongsCompanion
    extends UpdateCompanion<RecentlySearchedSong> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> songImage;
  const RecentlySearchedSongsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.songImage = const Value.absent(),
  });
  RecentlySearchedSongsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String artist,
    required String songImage,
  })  : title = Value(title),
        artist = Value(artist),
        songImage = Value(songImage);
  static Insertable<RecentlySearchedSong> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? songImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (songImage != null) 'song_image': songImage,
    });
  }

  RecentlySearchedSongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? artist,
      Value<String>? songImage}) {
    return RecentlySearchedSongsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      songImage: songImage ?? this.songImage,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentlySearchedSongsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('songImage: $songImage')
          ..write(')'))
        .toString();
  }
}

abstract class _$AudioDatabase extends GeneratedDatabase {
  _$AudioDatabase(QueryExecutor e) : super(e);
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
        recentlySearchedSongs
      ];
}
