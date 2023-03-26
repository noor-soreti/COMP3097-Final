import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/services/shopping_list_services.dart';
import 'package:mobile_app/views/login_screen.dart';
import 'package:provider/provider.dart';

class MyList extends StatefulWidget {
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ShoppingListService>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Card(),

            // children:
            // [
            //   ListTile(
            //     title: Text("My ShopU List"),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.all(20),
            //     child: Text('My List'),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.all(20),
            //     child: Text('My List'),
            //   ),
            // ],
          ),
        ),
      ],
    );
  }
}
