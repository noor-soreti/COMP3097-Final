// import 'package:drift/drift.dart';
// import 'package:drift/src/runtime/query_builder/query_builder.dart';
// import 'package:drift/src/dsl/dsl.dart';
// import 'package:flutter/foundation.dart';
// import 'package:mobile_app/database/database.dart';

// import '../main.dart';

// class TodoService with ChangeNotifier {
//   // final database = MyDatabase();

//   Future<void> addTodo(Todo todoEntry) async {
//     try {
//       database.addTodo(TodosCompanion(
//           title: Value(todoEntry.title),
//           content: Value(todoEntry.content),
//           category: Value(todoEntry.category)));

//       notifyListeners();
//     } catch (e) {
//       print("hee");
//     }
//   }

//   Future<void> getTodo() async {
//     try {
//       await database.allTodoEntries.then((value) => print(value));
//     } catch (e) {
//       print("noo");
//     }
//   }
// }
