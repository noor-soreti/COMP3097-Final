import 'package:flutter/material.dart';
import 'package:mobile_app/models/shopping_list_model.dart';
import 'package:mobile_app/services/shopping_list_services.dart';
import 'package:provider/provider.dart';

import '../services/user_services.dart';

class MyList extends StatefulWidget {
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<ShoppingList> userList = [];
  // List<double> currentTotal = [];
  double subTotal = 0.00;
  double total = 0.00;
  double tax = 0;
  bool _edit = false;
  int increment = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ShoppingListService>();
    var ctex = context.watch<UserService>();
    var currentUser = ctex.currentUser;

    appState.getShoppingList(currentUser.username).then((value) => {
          userList = appState.list,
        });
    appState.getPrice(currentUser.username).then((value) => total =
        appState.currentTotal.reduce((value, element) => value + element));

    tax = (total * .13);
    subTotal = total + tax;

    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Row(
          children: [
            TextButton(
              child: _edit == false
                  ? Text("Edit", style: TextStyle(fontWeight: FontWeight.w600))
                  : Text("Done"),
              onPressed: () {
                _edit = !_edit;
              },
            ),
          ],
        ),
        // WORKING ROW
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text("SUBTOTAL",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  SizedBox(
                    width: 120,
                  ),
                  Text("\$${subTotal.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                children: [
                  Text("TOTAL",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: 167,
                  ),
                  Text("\$${total.toStringAsFixed(2)}"),
                ],
              ),
              Row(
                children: [
                  Text("TAX (13% HST)",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: 117,
                  ),
                  Text("\$${tax.toStringAsFixed(2)}"),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: userList.length > 0
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                          child: ListTile(
                              leading:
                                  Text("\$${userList[index].price.toString()}"),
                              title: Text(userList[index].product),
                              trailing: !_edit
                                  ? Icon(null)
                                  : IconButton(
                                      onPressed: () {
                                        appState.deleteShoppingList(
                                            userList[index]);
                                      },
                                      icon: Icon(Icons.delete)))),
                    );
                  })
              : const Center(child: Text("No Items")),
        ),
      ],
    );
  }
}
