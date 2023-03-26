import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/views/main_screen.dart';
import 'package:provider/provider.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favourite = appState.favourites;

    if (favourite.isEmpty) {
      return Center(
        child: Text("My List"),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('My List'),
        ),
      ],
    );
  }
}
