import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/database/database.dart';

import '../api_service.dart';
import '../database/models.dart';
import '../main.dart';

class TodoService with ChangeNotifier {
  // final database = MyDatabase();

  Future<void> insertItems(Item item) async {
    try {
      database.insertItems(
          ItemDBCompanion(item: Value(item.item), price: Value(item.price)));
      print("ok");
    } catch (e) {
      print(e);
    }
  }

  Future<void> test() async {
    try {
      // database.getItemPrice(1002002);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> testingService(int id) async {
    try {
      dynamic service = await productInfoApi(id);
      return service;
    } catch (e) {
      // print("testsintService - ERROR");
      return e;
    }
  }

  // Future<void> addTodo(Todo todoEntry) async {
  //   try {
  //     database.addTodo(TodosCompanion(
  //         title: Value(todoEntry.title),
  //         content: Value(todoEntry.content),
  //         category: Value(todoEntry.category)));

  //     notifyListeners();
  //   } catch (e) {
  //     print("hee");
  //   }
  // }

  // Future<void> getTodo() async {
  //   try {
  //     await database.allTodoEntries.then((value) => print(value));
  //   } catch (e) {
  //     print("noo");
  //   }
  // }
}
