import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';

import '../../database/models.dart';

class UserService with ChangeNotifier {
  late User _currentUser;
  User get currentUser => _currentUser;

  Future<String> setCurrentUser(String username) async {
    String result = "ok";
    try {
      _currentUser = await database.getUser(username);
      notifyListeners();
    } catch (e) {
      result = "Err";
    }
    return result;
  }

  Future<String?> userExists(String username) async {
    String? result = "ok";
    try {
      await database.getUser(username);
      notifyListeners();
    } catch (e) {
      print("userExist - ERR");
      result = "User does not exist";
    }
    return result;
  }

  Future<String?> userLogin(String username, String password) async {
    String? result = "ok";
    try {
      await database.getUsernamePassword(username, password);
      notifyListeners();
    } catch (e) {
      result = "User does not exist";
    }
    return result;
  }

  Future<User> getUser(String username) async {
    return await database.getUser(username);
    // var userInfo = <String, String>{};

    // userInfo.addAll({
    //   'username': currentUser.username,
    //   'password': currentUser.password,
    //   // 'first name': currentUser.firstname,
    //   // 'last name': currentUser.lastname,
    //   // 'email': currentUser.email
    // });
    // return userInfo;
  }

  // Future<String> updateUser(String password) async {
  //   String result = "ok";
  //   _currentUser.password = password;
  //   notifyListeners();
  //   try {
  //     await UserDatabase.instance.updateUser(_currentUser);
  //   } catch (e) {
  //     result = "did not update";
  //   }
  //   return result;
  // }

  Future<String> createUser(User user) async {
    String result = "ok";
    try {
      await database.createUser(user);
      notifyListeners();
    } catch (e) {
      result = "did not create";
    }
    return result;
  }
}
