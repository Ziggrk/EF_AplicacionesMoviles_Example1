import 'dart:io';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';

class ComicDB extends Table{
  IntColumn get id =>integer().autoIncrement()();
  TextColumn get title =>text().named('title')();
  TextColumn get upc =>text().named('upc')();
  IntColumn get pageCount =>integer().named('pageCount')();
}
/*
class CreatorsDB extends Table {
  IntColumn get id => integer().named('id')();
  TextColumn get name => text().named('name')();
  TextColumn get role => text().named('role')();
}
class StoriesDB extends Table {
  IntColumn get id => integer().named('id')();
  TextColumn get name => text().named('name')();
  TextColumn get type => text().named('type')();

}
*/

LazyDatabase abrirConexion(){
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dbPost.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables:[ComicDB])
class AppDatabase extends _$AppDatabase{
  AppDatabase(NativeDatabase nativeDatabase):super(abrirConexion());
  @override
  int get schemaVersion=>1;

  Future<List<ComicDBData>> getListComics() async{
    return await select(comicDB).get();
  }
  Future<int> postComics(ComicDBCompanion comicDBCompanion) async{
    return await into(comicDB).insert(comicDBCompanion);
  }
  Future<int> deleteComics(int id) async{
    return await (delete(comicDB)..where((tbl) => tbl.id.equals(id))).go();
  }
}