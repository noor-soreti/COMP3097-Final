import 'package:realm/realm.dart';

class User {
  int? id;
  String? firstname;
  String? lastname;
  String? email;

  User() {}

  User.withoutId(this.firstname, this.lastname, this.email);

  User.all({this.id, this.firstname, this.lastname, this.email});

  Map<String, dynamic> toMap() {
    return {'id': id, 'firstname': firstname, 'lastname': lastname};
  }

  @override
  String toString() {
    return super.toString();
  }
}
