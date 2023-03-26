import 'package:flutter/material.dart';
import 'package:mobile_app/database/user_database.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/menu_screen.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();

  List<User> uList = [];

  @override
  void dispose() {
    myUsernameController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var appState = context.watch<UserService>();
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
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  User u = User(
                      username: myUsernameController.text,
                      password: myPasswordController.text);
                  var isLogged =
                      await appState.userExists(myUsernameController.text);

                  if (isLogged == "ok") {
                    String result = await context
                        .read<UserService>()
                        .getUser(myUsernameController.text);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SideMenu(username: myUsernameController.text)));
                  } else {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Oops'),
                        content: const Text('Username or password incorrect'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (formKey.currentState!.validate()) {
                  User u = User(
                      username: myUsernameController.text,
                      password: myPasswordController.text);
                  var isLogged =
                      await appState.userExists(myUsernameController.text);
                  String result =
                      await context.read<UserService>().createUser(u);
                  if (result != "ok") {
                    print("registered");
                  } else {
                    print("");
                  }
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

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
