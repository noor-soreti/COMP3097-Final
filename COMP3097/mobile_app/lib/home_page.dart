import 'package:flutter/material.dart';
import 'package:mobile_app/database/database.dart';
import 'package:mobile_app/database/extra/models/user_model.dart';
import 'package:mobile_app/views/profile.dart';
import 'package:mobile_app/views/search.dart';
import 'package:mobile_app/views/search_screen.dart';
import 'package:mobile_app/src/auth_service.dart';

class HomePage extends StatefulWidget {
  final UserModel userModel;
  const HomePage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget page = Profile();

  @override
  Widget build(BuildContext context) {
    // widget.userModel.id;
    final AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopU'),
        elevation: 0.0,
      ),
      drawer: Drawer(
          child: ListView(children: [
        const DrawerHeader(decoration: BoxDecoration(), child: Text('Menu')),
        ListTile(
          title: const Text('Home'),
          onTap: () => setState(() {
            page = Profile();
          }),
        ),
        ListTile(
          title: const Text('Search'),
          onTap: () => setState(() {
            page = SearchScreen();
          }),
        ),
        ListTile(
          title: const Text('Shopping Cart'),
          onTap: () => setState(() {
            page = Placeholder();
          }),
        ),
        ListTile(
          title: Text('Sign Out'),
          onTap: () => authService.signOut(),
        ),
      ])),
      body: page,
    );
  }
}
