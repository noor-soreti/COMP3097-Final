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
  ];
}

class UserModel {
  final String id;

  UserModel({required this.id});
}
