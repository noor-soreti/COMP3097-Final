import 'package:flutter/material.dart';
import 'package:mobile_app/src/user_model.dart';
import 'package:mobile_app/src/user_notifier.dart';
import 'package:mobile_app/views/profile.dart';
import 'package:mobile_app/views/search.dart';
import 'package:mobile_app/views/shopping_cart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required UserModel userModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget page = Profile();

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    await Provider.of<UserNotifier>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
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
            page = ShoppingCart();
          }),
        ),
        ListTile(
          title: Text('Sign Out'),
          onTap: () =>
              Provider.of<UserNotifier>(context, listen: false).signOut(),
        ),
      ])),
      body: page,
    );
  }
}
