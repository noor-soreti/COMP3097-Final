import 'dart:ffi';

class ProductCategory {
  int? id;
  String name;
  String description;

  ProductCategory({this.id, required this.name, required this.description});
}

class Product {
  int? id;
  String name;
  String description;
  double price;

  Product(
      {this.id,
      required this.name,
      required this.description,
      required this.price});

  factory Product.fromJSON(Map<String, Object> json) {
    return Product(
        name: json['name'] as String,
        description: json['description'] as String,
        price: json['price'] as double); // *****
  }
}

class User {
  int? id;
  String username;
  String password;
  String? firstname;
  String? lastname;
  String? email;

  User(
      {this.id,
      required this.username,
      required this.password,
      this.firstname,
      this.lastname,
      this.email});

  static User fromJSON(Map<String, Object> json) => User(
      username: json['username'] as String,
      password: json['password'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String);
}

class Cart {
  int id;
  String product;
  int quantity;

  Cart({required this.id, required this.product, required this.quantity});
}

class UserCart {
  final List<Cart> cart;
  UserCart({required this.cart});
}

///////////////

class Item {
  int? id;
  int? quantity;
  String item;
  String price;

  Item({this.id, this.quantity, required this.item, required this.price});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(item: json['item'], price: json['price']);
  }
}
