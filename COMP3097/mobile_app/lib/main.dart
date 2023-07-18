import 'package:flutter/material.dart';
import 'package:mobile_app/auth/auth_service.dart';
import 'package:mobile_app/src/user_notifier.dart';
import 'package:mobile_app/src/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// new
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // wrap root widget in StreamProvider and spec. what stream we want to listen to (onAuthStateChanged)
    // this allows descendants to access data provided by stream
    return MultiProvider(
      providers: [
        StreamProvider.value(
            value: AuthService().onAuthStateChanged, initialData: null),
        ChangeNotifierProvider(create: (context) => UserNotifier())
      ],
      builder: (context, child) {
        return MaterialApp(home: Wrapper());
      },
    );
  }
}


    // StreamProvider<UserModel?>.value(
    //     initialData: null,
    //     value: AuthService().onAuthStateChanged,
    //     builder: (context, snapshot) {
    //       return MaterialApp(
    //         home: Wrapper(),
    //       );
    //     });