import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/models/shopping_list_model.dart';
import 'package:mobile_app/services/shopping_list_services.dart';
import 'package:mobile_app/services/todo_service.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:provider/provider.dart';

import '../database/tables.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<String, dynamic>> _values = [];
  List<Map<String, dynamic>> _foundProduct = [];
  List<Map<String, dynamic>> shoppingList = [];

  @override
  void initState() {
    _foundProduct = _values;
    loadCSV();
    super.initState();
  }

// Load data from csv file
  void loadCSV() async {
    try {
      var data = await rootBundle.loadString("assets/food-prices-headers.csv");
      List<List<dynamic>> listData = const CsvToListConverter().convert(data);
      setState(() {
        for (var element in listData) {
          _values.add({
            "id": element[0],
            "product": element[1],
            "price": element[2],
          });

          // Provider.of<TodoService>(context, listen: false).insertItems(
          //     Item(item: element[0].toString(), price: element[2].toString()));
        }
      });
    } catch (e) {
      print(e);
    }
  }

// search function adds items to _foundProducts when selected
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _values;
    } else {
      results = _values
          .where(
              (user) => user["product"].toLowerCase().contains(enteredKeyword))
          .toList();
    }
    setState(() {
      _foundProduct = results;
    });
  }

  void sortDesc() {
    _foundProduct.sort((a, b) => (b["price"]).compareTo(
          a["price"],
        ));
    setState(() {
      _values = _foundProduct;
    });
  }

  void sortAsc() {
    _foundProduct.sort((a, b) => (a["price"]).compareTo(
          b["price"],
        ));
    setState(() {
      _values = _foundProduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ShoppingListService>();
    var ctex = context.watch<UserService>();
    var currentUser = ctex.currentUser;

    _foundProduct = _foundProduct;

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
        Row(
          children: [
            Text("SORT (price): "),
            ElevatedButton(
              onPressed: () => {sortDesc()},
              child: Text("Desc"),
            ),
            ElevatedButton(
              onPressed: () => {sortAsc()},
              child: Text("Asc"),
            )
          ],
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
                          name: _foundProduct[index]['product'],
                          price: _foundProduct[index]['price'],
                          quantity: 0);

                      appState.createShoppingList(list);
                    },
                    child: Icon(Icons.add)),
                title: Text(_foundProduct[index]["product"],
                    style: TextStyle(color: Colors.white)),
                trailing: (Text(
                  "\$${_foundProduct[index]['price'].toString()}",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
