import 'dart:ffi';

class ProductCategory {
  int? id;
  String name;
  String description;

  ProductCategory({this.id, required this.name, required this.description});
}

class Product {
  int id;
  String name;
  double price;

  Product({required this.id, required this.name, required this.price});

  Product.fromJSON(Map<String, Object?> json)
      : this(
            id: json['id'] as int,
            name: json['name'] as String,
            price: json['price'] as double); // *****

  Map<String, Object?> toJSON() {
    return {'id': id, 'name': name, 'price': price};
  }
}

class User {
  String? id;
  String email;
  String firstname;
  String lastname;

  User({
    this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  User.fromJSON(Map<String, Object?> json)
      : this(
          // id: json['id'] as String,
          email: json['email'] as String,
          firstname: json['firstname'] as String,
          lastname: json['lastname'] as String,
        );

  Map<String, Object?> toJSON() {
    return {'email': email, 'firstname': firstname, 'lastname': lastname};
  }
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
