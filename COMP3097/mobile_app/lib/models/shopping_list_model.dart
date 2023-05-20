const String listTable = 'list';

class ItemFields {
  static const String username = "username";
  static const name = "name";
  static const price = "price";
  static const quantity = "qty";
  static final List<String> allFields = [username, name, price, quantity];
}

class Item {
  int? id;
  final String username;
  late final int quantity;
  final String name;
  final double price;

  Item(
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

  static Item fromMap(Map<String, Object?> maps) => Item(
        username: maps[ItemFields.username] as String,
        name: maps[ItemFields.name] as String,
        price: maps[ItemFields.price] as double,
        quantity: maps[ItemFields.quantity] as int,
      );
}
