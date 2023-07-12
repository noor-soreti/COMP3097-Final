import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/database/database.dart';
import 'package:mobile_app/src/auth_service.dart';
import 'package:mobile_app/src/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database/extra/models/user_model.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
// new
import 'package:provider/provider.dart';

MyDatabase database = MyDatabase();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // database = MyDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // wrap root widget in StreamProvider and spec. what stream we want to listen to (onAuthStateChanged)
    // this allows descendants to access data provided by stream
    return StreamProvider<UserModel?>.value(
        initialData: null,
        value: AuthService().onAuthStateChanged,
        builder: (context, snapshot) {
          return MaterialApp(
            home: Wrapper(),
          );
        });
  }
}
