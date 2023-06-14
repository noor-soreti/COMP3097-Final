import 'dart:ffi';

class ProductCategory {
  int? id;
  String name;
  String description;

  ProductCategory({this.id, required this.name, required this.description});
}

class User {
  int? id;
  String username;
  String password;
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

class Product {
  int? id;
  String name;
  String description;
  Double price;

  Product(
      {this.id,
      required this.name,
      required this.description,
      required this.price});
}

class Cart {
  int? id;
  String product;
  int quantity;

  Cart({this.id, required this.product, required this.quantity});
}

class UserCart {
  int? id;
  List<Cart> cart;
  UserCart({this.id, required this.cart});
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
