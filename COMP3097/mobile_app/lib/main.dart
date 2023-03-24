import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

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
            title: const Text("ekek"),
          ),
          body: MyHomePage(),
        ),
      ),
    );
  }
}

// defines the data the app needs to function
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var user = <String, String>{};

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

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text('ShopU'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: myUsernameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: myPasswordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                var usernameText = Text(myUsernameController.text);
                var passwordText = Text(myPasswordController.text);
                // Validate returns true if the form is valid, or false otherwise.
                if (formKey.currentState!.validate()) {
                  appState.userLogin(usernameText.data, passwordText.data);
                }
              },
              child: const Text('Submit'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                var usernameText = Text(myUsernameController.text);
                var passwordText = Text(myPasswordController.text);
                // Validate returns true if the form is valid, or false otherwise.
                if (formKey.currentState!.validate()) {
                  appState.isRegisteredUser(
                      usernameText.data, passwordText.data);
                }
              },
              child: const Text('Register'),
            ),
          )
        ],
      ),
    );
  }
}
