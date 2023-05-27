import 'package:drift/drift.dart';

const String listTable = 'list';

class ItemFields {
  static const String username = "username";
  static const name = "name";
  static const price = "price";
  static const quantity = "qty";
  static final List<String> allFields = [username, name, price, quantity];
}

class ShoppingList {
  int? id;
  String username;
  int quantity;
  String name;
  double price;

  ShoppingList(
      {required this.username,
      required this.name,
      required this.price,
      required this.quantity});

  Map<String, Object?> toMap() => {
        ItemFields.username: username,
        ItemFields.name: name,
        ItemFields.price: price,
        ItemFields.quantity: quantity
      };

  static ShoppingList fromMap(Map<String, Object?> maps) => ShoppingList(
        username: maps[ItemFields.username] as String,
        name: maps[ItemFields.name] as String,
        price: maps[ItemFields.price] as double,
        quantity: maps[ItemFields.quantity] as int,
      );
}
