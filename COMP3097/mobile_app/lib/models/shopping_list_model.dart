const String listTable = 'list';

class ShoppingListFields {
  static const String username = "username";
  static const String product = "product";
  static const String price = "price";
  static const String quantity = "qty";
  static final List<Object> allFields = [username, product, price, quantity];
}

class ShoppingList {
  int? id;
  int quantity;
  String product;
  double price;

  ShoppingList(
      {required this.product, required this.price, required this.quantity});

  Map<Object, Object?> toMap() => {
        ShoppingListFields.product: product,
        ShoppingListFields.price: price,
        ShoppingListFields.quantity: quantity
      };

  static ShoppingList fromMap(Map<String, Object?> maps) => ShoppingList(
        product: maps[ShoppingListFields.product] as String,
        price: maps[ShoppingListFields.price] as double,
        quantity: maps[ShoppingListFields.quantity] as int,
      );
}
