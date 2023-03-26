import 'package:flutter/foundation.dart';
import 'package:mobile_app/database/user_database.dart';
import 'package:mobile_app/models/shopping_list_model.dart';

class ShoppingListService with ChangeNotifier {
  List<ShoppingList> _list = [];
  List<ShoppingList> get list => _list;

  Future<String> getShoppingList(String username) async {
    try {
      _list = await UserDatabase.instance.getShoppingList(username);
      notifyListeners();
    } catch (e) {
      return e.toString();
    }
    return 'ok';
  }

  Future<String> deleteShoppingList(ShoppingList shoppingList) async {
    try {
      await UserDatabase.instance.deleteShoppingList(shoppingList);
    } catch (e) {
      return e.toString();
    }
    String results = await getShoppingList(shoppingList.username);
    return results;
  }

  Future<String> createShoppingList(ShoppingList shoppingList) async {
    try {
      await UserDatabase.instance.createShoppingList(shoppingList);
    } catch (e) {
      return e.toString();
    }
    String results = await getShoppingList(shoppingList.username);
    return results;
  }
}
