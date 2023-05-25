import 'package:drift/drift.dart';

class Item {
  int? id;
  int quantity;
  String item;
  double price;

  Item(
      {this.id,
      required this.item,
      required this.quantity,
      required this.price});
}

class ItemDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get item => text()();
  IntColumn get quantity => integer()();
  IntColumn get price => integer()();
}

class ShoppingCarts extends Table {
  IntColumn get id => integer().autoIncrement()();
}

@DataClassName('ShoppingCartEntry')
class ShoppingCartEntries extends Table {
  IntColumn get shoppingCart => integer().references(ShoppingCarts, #id)();
  IntColumn get item => integer().references(Item, #id)();
}

class CartWithItems {
  final ShoppingCarts cart;
  final List<ItemDB> items;

  CartWithItems(this.cart, this.items);
}
