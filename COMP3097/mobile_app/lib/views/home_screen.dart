import 'package:flutter/material.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/login_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    // var favourite = appState.favourites;

    // if (favourite.isEmpty) {
    //   return Center(
    //     child: Text("Nothing to show"),
    //   );
    // }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Home'),
        ),
        // for (var fav in favourite)
        //   ListTile(
        //     leading: Icon(Icons.favorite),
        //     title: Text("Home"),
        //   )
      ],
    );
  }
}
