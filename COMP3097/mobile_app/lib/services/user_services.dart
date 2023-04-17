/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

import 'package:flutter/material.dart';
import 'package:mobile_app/database/user_database.dart';

import '../models/user_model.dart';

class UserService with ChangeNotifier {
  late User _currentUser;
  User get currentUser => _currentUser;

  Future<String> getUser(String username) async {
    String result = "ok";
    try {
      _currentUser = await UserDatabase.instance.getUser(username);
      notifyListeners();
    } catch (e) {
      result = "Err";
    }
    return result;
  }

  Future<String> userExists(String username) async {
    String result = "ok";
    try {
      await UserDatabase.instance.getUser(username);
    } catch (e) {
      result = "not exist";
    }
    return result;
  }

  Future<String> userLogin(String username, String password) async {
    String result = "ok";
    try {
      await UserDatabase.instance
          .getUsernamePassword(username, password)
          .then((value) {
        print(value);
      });
    } catch (e) {
      result = "not exist";
    }
    return result;
  }

  Map<String, String> getUserInfo(String username) {
    var userInfo = <String, String>{};
    userInfo.addAll({
      'username': currentUser.username,
      'password': currentUser.password,
      'first name': currentUser.firstname,
      'last name': currentUser.lastname,
      'email': currentUser.email
    });
    // print(userInfo['password']);
    return userInfo;
  }

  Future<String> updateUser(String password) async {
    String result = "ok";
    _currentUser.password = password;
    notifyListeners();
    try {
      await UserDatabase.instance.updateUser(_currentUser);
    } catch (e) {
      result = "did not update";
    }
    return result;
  }

  Future<String> createUser(User user) async {
    String result = "ok";
    try {
      await UserDatabase.instance.createUser(user);
    } catch (e) {
      result = "did not create";
    }
    notifyListeners();
    return result;
  }
}
