import 'package:drift/drift.dart';

import 'models.dart';

class ItemDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get item => text().unique()();
  TextColumn get price => text()();
}

class ShoppingCart extends Table {
  IntColumn get id => integer().autoIncrement()();
  // TextColumn get username => text().unique()();
  // TextColumn get password => text().withLength(min: 6)();
  // TextColumn get firstname => text()();
  // TextColumn get lastname => text()();
  // TextColumn get email => text().unique()();
}

@DataClassName('ShoppingCartEntry')
class ShoppingCartEntries extends Table {
  IntColumn get userShoppingCart => integer().references(ShoppingCart, #id)();
  IntColumn get item => integer().references(Item, #id)();
  DateTimeColumn get dateTimeAdded => dateTime()();
}

class CartWithItems {
  final ShoppingCart user;
  final List<Item> items;

  CartWithItems(this.user, this.items);
}
