import 'package:drift/drift.dart';

class Item {
  int? id;
  int? quantity;
  String item;
  String price;

  Item({this.id, this.quantity, required this.item, required this.price});
}

class ItemDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get item => text().unique()();
  TextColumn get price => text()();
}

class User {
  int? id;
  String username;
  String password;
  List<String>? shoppingList;
  String firstname;
  String lastname;
  String email;

  User(
      {this.id,
      required this.username,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.email});
}

class UserDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().unique()();
  TextColumn get password => text().withLength(min: 6)();
  TextColumn get firstname => text()();
  TextColumn get lastname => text()();
  TextColumn get email => text().unique()();
}

@DataClassName('ShoppingCartEntry')
class ShoppingCartEntries extends Table {
  IntColumn get shoppingCart => integer().references(UserDB, #id)();
  IntColumn get item => integer().references(Item, #id)();
}

class CartWithItems {
  final UserDB user;
  final List<Item> items;

  CartWithItems(this.user, this.items);
}
