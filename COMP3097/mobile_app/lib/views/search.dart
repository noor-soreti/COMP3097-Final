import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/src/product_service.dart';
import 'package:mobile_app/src/user_service.dart';

import '../database/extra/models/user_model.dart';
import '../src/auth_service.dart';
import '../src/models.dart';

class SearchScreen extends StatefulWidget {
  final UserModel userModel;

  const SearchScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final AuthService _authService = AuthService();

  ProductService _productService = ProductService();
  UserService _userService = UserService();

  List<Map<String, dynamic>> _values = [];
  List<Map<String, dynamic>> _foundProduct = [];

  @override
  void initState() {
    _foundProduct = _values;
    // setState(() {
    productList();
    // });
    super.initState();
  }

  Future productList() async {
    var element = await _productService.readData();

    for (var i in element) {
      print(i.id);
      _values.add({'id': i.id, 'name': i.name, 'price': i.price});
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _values;
    } else {
      results = _values
          .where((user) => user["name"].toLowerCase().contains(enteredKeyword))
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
    // final userModel = Provider.of<UserModel?>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
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
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
          itemCount: _foundProduct.length,
          itemBuilder: (context, index) => Card(
            key: ValueKey(_foundProduct[index]['id']),
            color: Colors.blue,
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListTile(
              leading: ElevatedButton(
                onPressed: () async {
                  Product p = Product(
                    id: _foundProduct[index]['id'],
                    name: _foundProduct[index]['name'],
                    price: _foundProduct[index]['price'],
                  );

                  String email = _authService.currentUser()!.email!;
                  User u = await _userService.readUserDataWithList(email);

                  List<Product> product = [];

                  u.product?.forEach((element) {
                    Product pro = Product(
                        id: element['id'],
                        name: element['name'],
                        price: element['price']);
                    product.add(pro);
                  });
                  product.add(p);

                  u.product = product;

                  _userService.update(u);
                },
                child: Icon(Icons.add),
              ),
              title: Text(_foundProduct[index]['name'],
                  style: TextStyle(color: Colors.white)),
              trailing: (Text(
                "\$${_foundProduct[index]['price'].toString()}",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ))
      ],
    );
  }
}
