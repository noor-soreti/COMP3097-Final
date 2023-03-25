import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/views/main_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final formKey = GlobalKey<FormState>();

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Home();
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
        body: Row(
          children: [
            /*
              The 'SafeArea' ensures that its child is not obscured by a hardware notch or a status bar
               */
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                /* show labels only if MyHomePage is at least 600 pixels wide (wrapped Scaffold with LayoutBuilder) */
                /* if change to true, it shows the labels next to the icons*/
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_basket),
                    label: Text('My List'),
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
                /*  selected index of zero selects the first destination, a selected index of one selects the second destination  */
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                    print(value);
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
          ],
        ),
      );
    });
  }
}

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

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favourite = appState.favourites;

    if (favourite.isEmpty) {
      return Center(
        child: Text("Offline"),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Search'),
        ),
      ],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favourite = appState.favourites;

    if (favourite.isEmpty) {
      return Center(
        child: Text("Nothing to show"),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Home'),
        ),
        for (var fav in favourite)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Home"),
          )
      ],
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
        child: Text("No likes"),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have `${favourite.length}` favourites:'),
        ),
        for (var fav in favourite)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Likes"),
          )
      ],
    );
  }
}
