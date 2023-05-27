import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mobile_app/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:mobile_app/database/tables.dart';

part 'database.g.dart';

// For each table you've specified in the @DriftDatabase annotation on your database class, a corresponding getter for a table will be generated (can be used to run statements)
@DriftDatabase(tables: [ItemDB, UserDB, ShoppingCartEntries, CartWithItems])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // Bump this number whenever change or add a table definition.
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        if (details.wasCreated) {
          delete(itemDB);
        }
      },
    );
  }

  // Future<List<ItemDB>> get allTodoEntries => select(itemDB).get();

  Future<void> insertItems(ItemDBCompanion item) async {
    await into(itemDB).insert(item);
  }

  Future<List<ItemDBData>> getItems() async {
    return await select(itemDB).get();
  }

  // Future<void> writeShoppingCart(CartWithItems entry) async {
  //   return transaction(() async {
  //     final cart = entry.user;
  //     await into(shoppingCarts)
  //         .insert(cart as Insertable<ShoppingCart>, mode: InsertMode.replace);
  //   });
  // }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.test'));
    return NativeDatabase.createInBackground(file);
  });
}
