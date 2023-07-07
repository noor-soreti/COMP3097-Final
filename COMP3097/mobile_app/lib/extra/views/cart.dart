import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return StreamProvider.value(
  //     initialData: null,
  //     value: database.cart,
  //     builder: (context, child) => Placeholder(),
  //   );
  // }
}
