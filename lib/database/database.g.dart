// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ComicDBData extends DataClass implements Insertable<ComicDBData> {
  final int id;
  final String title;
  final String upc;
  final int pageCount;
  ComicDBData(
      {required this.id,
      required this.title,
      required this.upc,
      required this.pageCount});
  factory ComicDBData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ComicDBData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      upc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}upc'])!,
      pageCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pageCount'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['upc'] = Variable<String>(upc);
    map['pageCount'] = Variable<int>(pageCount);
    return map;
  }

  ComicDBCompanion toCompanion(bool nullToAbsent) {
    return ComicDBCompanion(
      id: Value(id),
      title: Value(title),
      upc: Value(upc),
      pageCount: Value(pageCount),
    );
  }

  factory ComicDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComicDBData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      upc: serializer.fromJson<String>(json['upc']),
      pageCount: serializer.fromJson<int>(json['pageCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'upc': serializer.toJson<String>(upc),
      'pageCount': serializer.toJson<int>(pageCount),
    };
  }

  ComicDBData copyWith({int? id, String? title, String? upc, int? pageCount}) =>
      ComicDBData(
        id: id ?? this.id,
        title: title ?? this.title,
        upc: upc ?? this.upc,
        pageCount: pageCount ?? this.pageCount,
      );
  @override
  String toString() {
    return (StringBuffer('ComicDBData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('upc: $upc, ')
          ..write('pageCount: $pageCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, upc, pageCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComicDBData &&
          other.id == this.id &&
          other.title == this.title &&
          other.upc == this.upc &&
          other.pageCount == this.pageCount);
}

class ComicDBCompanion extends UpdateCompanion<ComicDBData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> upc;
  final Value<int> pageCount;
  const ComicDBCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.upc = const Value.absent(),
    this.pageCount = const Value.absent(),
  });
  ComicDBCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String upc,
    required int pageCount,
  })  : title = Value(title),
        upc = Value(upc),
        pageCount = Value(pageCount);
  static Insertable<ComicDBData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? upc,
    Expression<int>? pageCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (upc != null) 'upc': upc,
      if (pageCount != null) 'pageCount': pageCount,
    });
  }

  ComicDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? upc,
      Value<int>? pageCount}) {
    return ComicDBCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      upc: upc ?? this.upc,
      pageCount: pageCount ?? this.pageCount,
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
    if (upc.present) {
      map['upc'] = Variable<String>(upc.value);
    }
    if (pageCount.present) {
      map['pageCount'] = Variable<int>(pageCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComicDBCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('upc: $upc, ')
          ..write('pageCount: $pageCount')
          ..write(')'))
        .toString();
  }
}

class $ComicDBTable extends ComicDB with TableInfo<$ComicDBTable, ComicDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComicDBTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _upcMeta = const VerificationMeta('upc');
  @override
  late final GeneratedColumn<String?> upc = GeneratedColumn<String?>(
      'upc', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pageCountMeta = const VerificationMeta('pageCount');
  @override
  late final GeneratedColumn<int?> pageCount = GeneratedColumn<int?>(
      'pageCount', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, upc, pageCount];
  @override
  String get aliasedName => _alias ?? 'comic_d_b';
  @override
  String get actualTableName => 'comic_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<ComicDBData> instance,
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
    if (data.containsKey('upc')) {
      context.handle(
          _upcMeta, upc.isAcceptableOrUnknown(data['upc']!, _upcMeta));
    } else if (isInserting) {
      context.missing(_upcMeta);
    }
    if (data.containsKey('pageCount')) {
      context.handle(_pageCountMeta,
          pageCount.isAcceptableOrUnknown(data['pageCount']!, _pageCountMeta));
    } else if (isInserting) {
      context.missing(_pageCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ComicDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ComicDBData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ComicDBTable createAlias(String alias) {
    return $ComicDBTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ComicDBTable comicDB = $ComicDBTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [comicDB];
}
