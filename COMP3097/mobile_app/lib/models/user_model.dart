/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

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

class User {
  int? id;
  final String username;
  String password;
  // String firstname;
  // String lastname;
  // String email;

  User({
    required this.username,
    required this.password,
    // required this.firstname,
    // required this.lastname,
    // required this.email
  });

  User.withId({
    this.id,
    required this.username,
    required this.password,
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
  static User fromMap(Map<String, Object?> maps) => User(
        username: maps[UserFields.username] as String,
        password: maps[UserFields.password] as String,
        // firstname: maps[UserFields.firstname] as String,
        // lastname: maps[UserFields.lastname] as String,
        // email: maps[UserFields.email] as String
      );
}
