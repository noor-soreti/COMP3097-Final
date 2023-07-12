import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mobile_app/database/api_service.dart';
import 'package:mobile_app/src/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:mobile_app/database/tables.dart';

part 'database.g.dart';

// For each table you've specified in the @DriftDatabase annotation on your database class, a corresponding getter for a table will be generated (can be used to run statements)
@DriftDatabase(tables: [UserDB, ProductDB, CartItem])
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
    });
  }

  // Stream<List<Todo>> watchEntriesInCategory(Category c) {
  //   return (select(todos)..where((t) => t.category.equals(c.id))).watch();
  // }

  /* USER */

  Future<User> getUser(String username) async {
    final query =
        (select(userDB)..where((tbl) => tbl.username.equals(username)));

    return query
        .map((event) => User(
            // username: event.username,
            email: event.email,
            firstname: event.firstName,
            lastname: event.lastName))
        .getSingle();
  }

  FutureOr<user> getUsernamePassword(String username, String password) async {
    return await (select(userDB)
          ..where((tbl) =>
              tbl.username.equals(username) & tbl.password.equals(password)))
        .getSingle();
  }

  Future<List<User>> getAllUsers() async {
    final query = (select(userDB));
    return await query
        .map((q) => User(
            // username: q.username,
            email: q.email,
            firstname: q.firstName,
            lastname: q.lastName))
        .get();
    // return result.map()....
  }

  Future deleteUser(String username) async {
    return (delete(userDB)..where((u) => u.username.equals(username)));
  }

  /* CART */

  Future<void> getUserCart(User user) async {
    var t = await (select(cartItem)
          ..where((tbl) => tbl.userId.equals(user.id!)))
        .get();

    print(t);
  }

  Future<void> userShoppingCart(UserCart userCart) async {
    // final cart = userCart.user;

    // for (var i in userCart.cart) {
    //   print(i.product);
    //   await into(cartItem).insert(CartItemCompanion.insert(
    //       userId: cart.id ?? 0, productId: i.id, quantity: i.quantity));
    // }
  }

  /* PRODUCT */

  Future<List<Product>> getAllProducts() async {
    final query = select(productDB);
    print("QUERY");

    return await query
        .map((q) => Product(
            id: q.id, name: q.name, description: q.description, price: q.price))
        .get();
  }

  Future<void> insertProduct() async {
    var data = await rootBundle.loadString("assets/top-1k-ingredients.csv");
    List<List<dynamic>> listData =
        const CsvToListConverter().convert(data, eol: "\n");
    var count = 0;

    for (var e in listData) {
      while (count < 2) {
        productInfoApi(e[1]).then((value) => {
              print(
                  'e1 (id): ${e[1]}\ne[0] (name): ${e[0]}\n description: XX\nprice: ${value['estimatedCost']['value']}'),
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

  Future<void> getProduct(String product) async {
    final query = await getAllProducts;

    final test = await select(productDB).get(); // where product.name == product
    print(test);
  }

  Future<void> x(int id) async {
    http.Response response = await http.get(Uri.parse(
        "http://api.spoonacular.com/food/ingredients/9266/information?amount=1?apiKey=db619c3581aa4df5a89cad80446e37fe"));
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
                    batch.insertAll(productDB, [
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
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'testing5.sqlite'));

    if (!await file.exists()) {
      print("_openConnection (database.dart) - file does not exist");
    } else {
      print("_openConnection (database.dart) - file exists");
    }

    return NativeDatabase.createInBackground(file);
  });
}
