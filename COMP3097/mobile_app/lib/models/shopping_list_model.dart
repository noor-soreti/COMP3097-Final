const String listTable = 'list';

class ShoppingListFields {
  static const String username = "username";
  static const title = "title";
  static final List<String> allFields = [username, title];
}

class ShoppingList {
  int? id;
  final String username;
  final String title;

  ShoppingList({required this.username, required this.title});

  Map<String, Object?> toMap() =>
      {ShoppingListFields.username: username, ShoppingListFields.title: title};

  static ShoppingList fromMap(Map<String, Object?> maps) => ShoppingList(
        username: maps[ShoppingListFields.username] as String,
        title: maps[ShoppingListFields.title] as String,
      );
}
