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

class User {
  int? id;
  String username;
  String password;
  List<String>? shoppingList;
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

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
