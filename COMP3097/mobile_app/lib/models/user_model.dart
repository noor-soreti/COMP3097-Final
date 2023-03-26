const String usertable = 'user';

class UserFields {
  static const String username = "test_username";
  static const String password = "password";

  static final List<String> allFields = [
    username,
    password,
  ];
}

class User {
  final String username;
  String password;

  User({
    required this.username,
    required this.password,
  });

  // convert User to map with String as key and Object and value
  Map<String, Object?> toMap() =>
      {UserFields.username: username, UserFields.password: password};

// getting data back from db, convert from map to User obj
  static User fromMap(Map<String, Object?> maps) => User(
      username: maps[UserFields.username] as String,
      password: maps[UserFields.password] as String);}
