import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mobile_app/api_service.dart';
import 'package:mobile_app/database/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:mobile_app/database/tables.dart';

part 'database.g.dart';

// For each table you've specified in the @DriftDatabase annotation on your database class, a corresponding getter for a table will be generated (can be used to run statements)
@DriftDatabase(
    tables: [UserDB, ProductDB, ItemDB, ShoppingCart, ShoppingCartEntries])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // Bump this number whenever change or add a table definition.
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) async {
      await m.createAll();
      await insertProduct();
      // await productCategoryInsert();
      // await insertProductCategories();
    });
  }

  /* PRODUCE */

  Future<void> insertProduct() async {
    var data = await rootBundle.loadString("assets/top-1k-ingredients.csv");
    List<List<dynamic>> listData =
        const CsvToListConverter().convert(data, eol: "\n");
    var count = 0;

    for (var e in listData) {
      while (count < 150) {
        productInfoApi(e[1]).then((value) => {
              into(productDB).insert(ProductDBCompanion.insert(
                  id: e[1],
                  name: e[0],
                  description: "description",
                  price: value['estimatedCost']['value']))
            });
        count++;
        break;
      }
    }
  }

  Future<void> getAllProducts() async {
    List<product> result = await (select(productDB)).get();
    for (var i in result) {
      print(i);
    }
  }

  /* USER */

  Future<User> createUser(User user) async {
    await into(userDB).insert(UserDBCompanion.insert(
        username: user.username,
        password: user.password,
        email: user.email,
        firstName: user.firstname,
        lastName: user.lastname));
    return user;
  }

  Stream<user> getUser(String username) {
    return (select(userDB)..where((u) => u.username.equals(username)))
        .watchSingle();
  }

  Future<List<user>> getAllUsers() async {
    final result = (select(userDB)).get();
    return result;
    // return result.map()....
  }

  Future updateUser(User user) {
    return (update(userDB)..where((u) => u.username.equals(user.username)))
        .write(UserDBCompanion(
      username: Value(user.username),
      password: Value(user.password),
      firstName: Value(user.firstname),
      lastName: Value(user.lastname),
      email: Value(user.email),
    ));
  }

  Future deleteUser(String username) async {
    return (delete(userDB)..where((u) => u.username.equals(username)));
  }

  Future<void> productCategoryInsert() async {
    // List<List<dynamic>> listData = await loadCSV();
    // var count = 0;
    // for (var e in listData) {
    //   testService(e[1]).then((value) => into(productCategoryDB)
    //       .insert(ProductCategoryDBCompanion(name: Value(value['aisle']))));
    // }

    // await batch((batch) {
    //   batch.insertAll(productCategoryDB, [
    //     ProductCategoryDBCompanion.insert(
    //         name: "fruit", desc: "produce with seeds"),
    //     ProductCategoryDBCompanion.insert(
    //         name: "vegetable", desc: "produce without seeds"),
    //     ProductCategoryDBCompanion.insert(
    //         name: "canned goods", desc: "food in can"),
    //     ProductCategoryDBCompanion.insert(
    //         name: "frozen foods", desc: "frozen foods"),
    //     ProductCategoryDBCompanion.insert(name: "meat", desc: "meat"),
    //     ProductCategoryDBCompanion.insert(
    //         name: "fish & shellfish", desc: "fish & shellfish"),
    //     ProductCategoryDBCompanion.insert(name: "other", desc: "other foods")
    //   ]);
    // });
  }

  Future<void> x(int id) async {
    http.Response response = await http.get(Uri.parse(
        "http://api.spoonacular.com/food/ingredients/9266/information?amount=1?apiKey=b2de2effb6dd4e71b9ea35cf43c7aeaf"));
    if (response.statusCode == 200) {
      print("great");
    } else {
      print(response.body);
    }
  }

  Future<void> insertProductCategories() async {
    List<List<dynamic>> listData = await loadCSV();
    var count = 0;

    for (var e in listData) {
      while (count <= 15) {
        productInfoApi(e[1]).then((value) => {
              batch((batch) => {
                    batch.insertAll(itemDB, [
                      ProductDBCompanion.insert(
                          // categoryId: value['aisle'].toLowerCase(),
                          id: e[0],
                          name: e[1],
                          description: value['originalName'],
                          price: value['estimatedCost'])
                    ])
                  })
            });
      }
    }
  }

  Future<List<List<dynamic>>> loadCSV() async {
    var data = await rootBundle.loadString("assets/top-1k-ingredients.csv");
    List<List<dynamic>> listData =
        const CsvToListConverter().convert(data, eol: "\n");
    return listData;
  }

  Future<void> insertItems(ItemDBCompanion item) async {
    await into(itemDB).insert(item);
  }

  Future<List<ItemDBData>> getItems() async {
    return await select(itemDB).get();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'testing3.db'));

    if (!await file.exists()) {
      print("!await");
    } else {
      print("!not");
    }

    return NativeDatabase.createInBackground(file);
  });
}
