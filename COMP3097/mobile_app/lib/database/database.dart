import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:mobile_app/database/tables.dart';

part 'database.g.dart';

// For each table you've specified in the @DriftDatabase annotation on your database class, a corresponding getter for a table will be generated (can be used to run statements)
@DriftDatabase(tables: [ItemDB])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // Bump this number whenever change or add a table definition.
  @override
  int get schemaVersion => 1;

  Future<void> insertItems() async{

  }

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
