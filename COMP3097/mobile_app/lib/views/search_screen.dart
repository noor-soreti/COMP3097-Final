import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  void _edit() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<UserService>();

    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        TextField(
          onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
              labelText: 'Search', suffixIcon: Icon(Icons.search)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _foundProduct.length,
            itemBuilder: (context, index) => Card(
              key: ValueKey(_foundProduct[index]["id"]),
              color: Colors.blue,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: ElevatedButton(
                    onPressed: () async {
                      String username = await context
                          .read()<UserService>()
                          .currentUser
                          .username;
                      // print(username);
                      // var userList = await context
                      //     .read<ShoppingListService>()
                      //     .getShoppingList(username);
                      // if (userList == 'ok') {
                      //   print("ok");
                      // } else {
                      //   print("not ");
                      // }
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
