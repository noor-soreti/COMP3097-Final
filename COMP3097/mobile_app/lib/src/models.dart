class Product {
  int id;
  String name;
  double price;
  int? quantity;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      this.quantity});

  factory Product.fromJSON(Map<String, Object?> json) {
    // if (json['quantity'] != null) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
    );
    // }
    // return Product(
    //     id: json['id'] as int,
    //     name: json['name'] as String,
    //     price: json['price'] as double);
  } // *****

  Map<String, Object?> toJSON() {
    return {'id': id, 'name': name, 'price': price, 'quantity': quantity};
  }

  bool contains(List<Product> list, Product p) {
    for (var i in list) {
      if (i.id == p.id) {
        return true;
      }
    }
    return false;
  }
}

class User {
  String? id;
  String email;
  String firstname;
  String lastname;
  List<Product>? product;

  User({
    this.id,
    this.product,
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

  Object? test(Map<String, Object?> json) {
    return json['product'];
  }

  User.fromJSONToList(Map<String, Object?> json)
      : this(

            // id: json['id'] as String,
            email: json['email'] as String,
            firstname: json['firstname'] as String,
            lastname: json['lastname'] as String,
            product: json['product'] as List<Product>);
}
