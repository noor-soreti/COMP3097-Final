import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/shopping_list_model.dart';
import 'package:mobile_app/services/shopping_list_services.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/login_screen.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<String, dynamic>> _searchValues = [
    {"id": 1, "product": "tomato"},
    {"id": 2, "product": "avocado"},
    {"id": 3, "product": "cheese"},
    {"id": 4, "product": "olive oil"},
    {"id": 5, "product": "grapes"}
  ];

  List<Map<String, dynamic>> _foundProduct = [];

  List<Map<String, dynamic>> shoppingList = [];

  @override
  void initState() {
    _foundProduct = _searchValues;
    super.initState();
  }

  // var test = ShoppingListService();

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _searchValues;
    } else {
      results = _searchValues
          .where(
              (user) => user["product"].toLowerCase().contains(enteredKeyword))
          .toList();
    }
    setState(() {
      _foundProduct = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ShoppingListService>();
    var ctex = context.watch<UserService>();
    var currentUser = ctex.currentUser;

    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
                labelText: 'Search', suffixIcon: Icon(Icons.search)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _foundProduct.length,
            itemBuilder: (context, index) => Card(
              key: ValueKey(_foundProduct[index]["id"]),
              color: Colors.blue,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListTile(
                leading: ElevatedButton(
                    onPressed: () {
                      print(_foundProduct[index]['id']);
                      var list = ShoppingList(
                          username: currentUser.username,
                          title: _foundProduct[index]['product']);
                      // appState
                      //     .getShoppingList(currentUser.username)
                      //     .then((value) => print(value));

                      appState.addToList(currentUser.username);
                    },
                    child: Icon(Icons.add)),
                title: Text(_foundProduct[index]["product"],
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
