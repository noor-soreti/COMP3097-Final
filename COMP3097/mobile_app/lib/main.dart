import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/main_screen.dart';

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
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromRGBO(56, 160, 224, 0.438))),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("ShopU"),
          ),
          body: LoginPage(),
        ),
      ),
    );
  }
}
