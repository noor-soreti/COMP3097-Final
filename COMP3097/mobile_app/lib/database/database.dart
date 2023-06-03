import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:mobile_app/database/tables.dart';

part 'database.g.dart';

// For each table you've specified in the @DriftDatabase annotation on your database class, a corresponding getter for a table will be generated (can be used to run statements)
@DriftDatabase(
    tables: [ItemDB, ShoppingCart, ShoppingCartEntries, CartWithItems])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // Bump this number whenever change or add a table definition.
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) async {
      await m.createAll();
      // await loadItems();
    });
  }

  Future<void> loadItems() async {
    try {
      var data = await rootBundle.loadString("assets/top-1k-ingredients.csv");
      List<List<dynamic>> listData = const CsvToListConverter().convert(data);
      for (var element in listData) {
        // var elementPrice = await
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<int> return price of item

  Future<void> getItemPrice(int id) async {
    http.Response response = await http.get(Uri.parse(
        "http://api.spoonacular.com/food/ingredients/9266/information?amount=1?apiKey=b2de2effb6dd4e71b9ea35cf43c7aeaf"));
    if (response.statusCode == 200) {
      print("gresat");
    } else {
      print(response.body);
    }
    // http.Response response = await http.get(Uri(
    //     scheme: 'https',
    //     host: 'api.spoonacular.com',
    //     path: "food/ingredients/9266/information?amount=1",
    //     queryParameters: {'apiKey': dotenv.env['API_KEY']}));
    // var data = jsonDecode(response.toString());
    // print(response);
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
    final file = File(p.join(dbFolder.path, 'another.db'));

    if (!await file.exists()) {
      print("!await");
    } else {
      print("!not");
    }

    return NativeDatabase.createInBackground(file);
  });
}
