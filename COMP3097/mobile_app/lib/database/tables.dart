import 'package:drift/drift.dart';

import 'models.dart';

// @DataClassName('product_category')
// class ProductCategoryDB extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text().unique()();
//   TextColumn get desc => text()();
// }

@DataClassName('user')
class UserDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().unique()();
  TextColumn get password => text()();
  TextColumn get email => text().unique()();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
}

@DataClassName('product')
class ProductDB extends Table {
  IntColumn get id => integer()();
  // IntColumn get categoryId =>
  //     integer().references(ProductCategoryDB, #id).named('category_id')();
  TextColumn get name => text().unique()();
  TextColumn get description => text()();
  RealColumn get price => real()();
}

@DataClassName('cart_items')
class CartItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(UserDB, #id).named('user_id')();
  IntColumn get productId =>
      integer().references(ProductDB, #id).named('product_id')();
  IntColumn get quantity => integer()();
}

///////////////

class ItemDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer()();
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
  IntColumn get item => integer().references(ItemDB, #id)();
  DateTimeColumn get dateTimeAdded => dateTime()();
}

class CartWithItems {
  final ShoppingCart user;
  final List<Item> items;

  CartWithItems(this.user, this.items);
}
