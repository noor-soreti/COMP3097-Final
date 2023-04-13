import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/models/shopping_list_model.dart';
import 'package:mobile_app/services/shopping_list_services.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:provider/provider.dart';

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

  void loadCSV() async {
    try {
      var data = await rootBundle.loadString("assets/food.csv");
      List<List<dynamic>> listData = const CsvToListConverter().convert(data);

      setState(() {
        listData.forEach((element) {
          _values.add({"id": element[0], "product": element[1]});
        });
      });
    } catch (e) {
      print(e);
    }
  }

  // var test = ShoppingListService();

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

                      appState.createShoppingList(list);
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
