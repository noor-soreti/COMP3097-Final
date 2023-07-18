import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/service/user_service.dart';
import 'package:mobile_app/src/models.dart';
import 'package:mobile_app/src/user_notifier.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Product> productList = [];
  List<double> currentTotal = [];
  double subTotal = 0.00;
  double total = 0.00;
  double tax = 0;
  bool _edit = false;
  int increment = 0;

  @override
  void initState() {
    test();

    super.initState();
  }

  test() async {
    var i =
        await Provider.of<UserNotifier>(context, listen: false).getUserCart();

    for (var t in i['product']) {
      Product p = Product(id: t['id'], name: t['name'], price: t['price']);
      productList.add(p);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    

    return Consumer<UserNotifier>(
      builder: (context, value, child) {
        return Column(
          children: [
            Row(
              children: [
                TextButton(
                  child: _edit == false
                      ? Text("Edit",
                          style: TextStyle(fontWeight: FontWeight.w600))
                      : Text("Done"),
                  onPressed: () {
                    setState(() {
                      _edit = !_edit;
                    });
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("SUBTOTAL",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
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
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                      SizedBox(
                        width: 167,
                      ),
                      Text("\$${total.toStringAsFixed(2)}"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("TAX (13% HST)",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
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
                child: productList.isNotEmpty
                    ? ListView.builder(
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: !_edit
                                  ? Icon(null)
                                  : IconButton(
                                      onPressed: () {
                                        Provider.of<UserNotifier>(context,
                                                listen: false)
                                            .deleteProduct(productList[index]);
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                              title: Text(
                                  "${productList[index].name[0].toUpperCase()}${productList[index].name.substring(1)} "),
                              trailing: Text("\$${productList[index].price}"),
                            ),
                          );
                        })
                    : Center(child: Text("No Items")))
          ],
        );
      },
    );
  }
}
