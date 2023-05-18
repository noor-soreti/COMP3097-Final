import 'package:mobile_app/models/shopping_list_model.dart';

const String usertable = 'user';

class UserFields {
  static const String username = "username";
  static const String password = "password";
  static const String shoppingList = "shopping_list";
  // static const String firstname = "firstname";
  // static const String lastname = "lastname";
  // static const String email = "email";

  static final List<String> allFields = [
    username,
    password,
    shoppingList
    // firstname,
    // lastname,
    // email
  ];
}

class User {
  int? id;
  final String username;
  String? password;
  Set<ShoppingList>? shoppingList;
  // String firstname;
  // String lastname;
  // String email;

  User({
    required this.username,
    required this.password,
    Set<ShoppingList>? shoppingList,
    // required this.firstname,
    // required this.lastname,
    // required this.email
  });

  User.usernameAndShoppingList(
      {required this.username, required Set<ShoppingList> this.shoppingList
      // required this.firstname,
      // required this.lastname,
      // required this.email
      });

  // convert User to map with String as key and Object and value
  Map<String, Object?> toMap() => {
        UserFields.username: username,
        UserFields.password: password,
        UserFields.shoppingList: shoppingList
        // UserFields.firstname: firstname,
        // UserFields.lastname: lastname,
        // UserFields.email: email
      };

// getting data back from db, convert from map to User obj
  static User fromMap(Map<Object, Object?> maps) => User(
        username: maps[UserFields.username] as String,
        password: maps[UserFields.password] as String,
        shoppingList: maps[UserFields.password] as Set<ShoppingList>,
        // firstname: maps[UserFields.firstname] as String,
        // lastname: maps[UserFields.lastname] as String,
        // email: maps[UserFields.email] as String
      );
}
