import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';


void main() {
  runApp(MyApp());
}

/* 
Code in MyApp sets up the whole app. It creates the app-wide state, names the app, defines the visual theme, and sets the "home" widget—the starting point of your app.
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("ShopU"),
          ),
          body: MyHomePage(),
        ),
      ),
    );
  }
}

/*
 The MyAppState class defines the app's state and the data the app needs to function
 
 */
class MyAppState extends ChangeNotifier {
  var user = <String, String>{};
  var favourites = <String>[];
  var shoppingList = <String>[];

  void isFavourite(value) {
    if (!favourites.contains(value)) {
      favourites.add(value);
    } else {
      print("fave");
    }
    notifyListeners();
  }

  void isRegisteredUser(username, password) {
    if (user.containsKey(username)) {
      print('Username `$username` already exists.');
    } else {
      user.addAll({username.toString(): password.toString()});
      print('Registered `$username`.');
    }
    notifyListeners();
  }

  void userLogin(username, password) {
    if (user.containsKey(username) && user.containsValue(password)) {
      print('Success');
    } else {
      print("Username or password incorret");
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();

  var selectedIndex = 0;

  @override
  void dispose() {
    myUsernameController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final formKey = GlobalKey<FormState>();

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Placeholder();
        break;
      case 1:
        page = MyList();
        break;
      case 2:
        page = Search();
        break;
      case 3:
        page = Likes();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(children: [
          SafeArea(
            child: NavigationRail(
              extended: constraints.maxWidth >= 600,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_cart),
                  label: Text('My ShopU List'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.search),
                  label: Text('Search'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Likes'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ]),
      );
    });
    // Form(
    //   key: formKey,
    //   child: Column(
    //     children: [
    //       Text('ShopU'),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    //         child: TextFormField(
    //           controller: myUsernameController,
    //           decoration: const InputDecoration(
    //               border: OutlineInputBorder(), hintText: 'Enter username'),
    //           validator: (value) {
    //             if (value == null || value.isEmpty) {
    //               return 'Please enter username';
    //             }
    //             return null;
    //           },
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    //         child: TextFormField(
    //           controller: myPasswordController,
    //           decoration: const InputDecoration(
    //               border: OutlineInputBorder(), hintText: 'Enter password'),
    //           validator: (value) {
    //             if (value == null || value.isEmpty) {
    //               return 'Please enter password';
    //             }
    //             return null;
    //           },
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 16.0),
    //         child: ElevatedButton(
    //           onPressed: () {
    //             var usernameText = Text(myUsernameController.text);
    //             var passwordText = Text(myPasswordController.text);
    //             // Validate returns true if the form is valid, or false otherwise.
    //             if (formKey.currentState!.validate()) {
    //               appState.userLogin(usernameText.data, passwordText.data);
    //             }
    //           },
    //           child: const Text('Submit'),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 16.0),
    //         child: ElevatedButton(
    //           onPressed: () {
    //             var usernameText = Text(myUsernameController.text);
    //             var passwordText = Text(myPasswordController.text);
    //             // Validate returns true if the form is valid, or false otherwise.
    //             if (formKey.currentState!.validate()) {
    //               appState.isRegisteredUser(
    //                   usernameText.data, passwordText.data);
    //             }
    //           },
    //           child: const Text('Register'),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No ShopU lists yet"),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search not available yet"),
    );
  }
}

class Likes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favourite = appState.favourites;

    if (favourite.isEmpty) {
      return Center(
        child: Text("No favourites yet"),
      );
    }

    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have `${favourite.length}`')),
        for (var fav in favourite)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(fav),
          )
      ],
    );
  }
}
