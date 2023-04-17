/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

const String listTable = 'list';

class ShoppingListFields {
  static const String username = "username";
  static const title = "title";
  static const price = "price";
  static final List<String> allFields = [username, title, price];
}

class ShoppingList {
  int? id;
  final String username;
  final String title;
  final double price;

  ShoppingList({required this.username, required this.title, required this.price});

  Map<String, Object?> toMap() =>
      {ShoppingListFields.username: username, ShoppingListFields.title: title, ShoppingListFields.price: price};

  static ShoppingList fromMap(Map<String, Object?> maps) => ShoppingList(
        username: maps[ShoppingListFields.username] as String,
        title: maps[ShoppingListFields.title] as String,
        price: maps[ShoppingListFields.price] as double,
      );
}
