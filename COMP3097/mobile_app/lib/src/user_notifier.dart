import 'package:flutter/material.dart';
import 'package:mobile_app/service/user_service.dart';
import 'package:mobile_app/src/models.dart';

import '../auth/auth_service.dart';

class UserNotifier extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  late User _currentUser;
  User get currentUser => _currentUser;

  // only used in home_page.dart
  Future getUser() async {
    String email = _authService.currentUser()!.email!;
    _currentUser = await _userService.readUserData(email);
    notifyListeners();
  }

  Future getUserCart() async {
    return await _userService.readUserDataWithList(_currentUser.email);
  }

  Future addProduct(Product p) async {
    List<Product> product = [];
    var u = await _userService.readUserDataWithList(_currentUser.email);

    for (var i in u['product']) {
      Product one = Product(
          id: i['id'],
          name: i['name'],
          price: i['price'],
          quantity: i['quantity']);
      product.add(one);
    }

    var containsList = p.contains(product, p);

    // if true, increment p.quantity
    if (containsList) {
      var t = product.where((element) => element.id == p.id);
      for (var i in t) {
        if (i.id == p.id) {
          i.quantity = i.quantity! + 1;
        }
      }
    } else {
      p.quantity = 1;
      print(p.quantity);
      product.add(p);
      print('eet');
    }

    // product.add(p);

    _currentUser.product = product;
    await _userService.updateCart(_currentUser);
    notifyListeners();
  }

  Future update(User user) async {
    await _userService.update(user);
    String email = _authService.currentUser()!.email!;
    _currentUser = await _userService.readUserData(email);
    notifyListeners();
  }

  Future deleteProduct(Product p) async {
    print(p.id);
    List<Product> product = [];
    // var u = await _userService.readUserDataWithList(_currentUser.email);
    // for (var i in u['product']) {
    //   Product one = Product(id: i['id'], name: i['name'], price: i['price']);
    //   product.add(one);
    // }
  }

  signOut() {
    _authService.signOut();
  }
}
