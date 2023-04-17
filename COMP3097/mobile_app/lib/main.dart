/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

import 'package:flutter/material.dart';
import 'package:mobile_app/services/shopping_list_services.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/login_screen.dart';
import 'package:mobile_app/views/splash_screen.dart';
import 'package:provider/provider.dart';

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
      create: (context) => UserService(),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => UserService()),
            ChangeNotifierProvider(create: (context) => ShoppingListService())
          ],
          child: MaterialApp(
            title: 'Namer App',
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Color.fromRGBO(56, 160, 224, 0.438))),
            // Application will show splash screen for specified number of seconds before being navigated to login page
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          )),
    );
  }
}
