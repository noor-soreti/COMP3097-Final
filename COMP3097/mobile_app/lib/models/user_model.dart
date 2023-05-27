import 'package:mobile_app/models/shopping_list_model.dart';

const String usertable = 'user';

class UserFields {
  static const String username = "username";
  static const String password = "password";
  // static const String firstname = "firstname";
  // static const String lastname = "lastname";
  // static const String email = "email";

  static final List<String> allFields = [
    username,
    password,
    // firstname,
    // lastname,
    // email
  ];
}

class UserModel {
  int? id;
  final String username;
  String password;
  List<String>? shoppingList;
  // String firstname;
  // String lastname;
  // String email;

  UserModel({
    required this.username,
    required this.password,
    // required this.firstname,
    // required this.lastname,
    // required this.email
  });

  UserModel.all(
      {this.id,
      required this.username,
      required this.password,
      required this.shoppingList
      // required this.firstname,
      // required this.lastname,
      // required this.email
      });

  // convert User to map with String as key and Object and value
  Map<String, Object?> toMap() => {
        UserFields.username: username,
        UserFields.password: password,
        // UserFields.firstname: firstname,
        // UserFields.lastname: lastname,
        // UserFields.email: email
      };

// getting data back from db, convert from map to User obj
  static UserModel fromMap(Map<String, Object?> maps) => UserModel(
        username: maps[UserFields.username] as String,
        password: maps[UserFields.password] as String,
        // firstname: maps[UserFields.firstname] as String,
        // lastname: maps[UserFields.lastname] as String,
        // email: maps[UserFields.email] as String
      );
}
