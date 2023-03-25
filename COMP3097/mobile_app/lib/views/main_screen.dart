import 'package:flutter/material.dart';
import 'package:mobile_app/views/home_screen.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../services/user_services.dart';

/*
 The MyAppState class defines the app's state and the data the app needs to function
 */
class MyAppState extends ChangeNotifier {
  var userMap = <String, String>{};
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
    if (userMap.containsKey(username)) {
      print('Username `$username` already exists.');
    } else {
      userMap.addAll({username.toString(): password.toString()});
      print('Registered `$username`.');
    }
    notifyListeners();
  }

  bool userLogin(username, password) {
    if (userMap.containsKey(username) && userMap.containsValue(password)) {
      print('Success');
      notifyListeners();
      return true;
    } else {
      print("Username or password incorrect");
      notifyListeners();
      return false;
    }
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();

  // LoginPage(MyAppState appState);

  void dispose() {
    myUsernameController.dispose();
    myPasswordController.dispose();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var appState = context.watch<MyAppState>();

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
                  var isLogged =
                      appState.userLogin(usernameText.data, passwordText.data);
                  if (isLogged) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                username: myUsernameController.text)));
                  }
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

// class LoginPage extends StatelessWidget {
//   final myUsernameController = TextEditingController();
//   final myPasswordController = TextEditingController();

//   // LoginPage(MyAppState appState);

//   void dispose() {
//     myUsernameController.dispose();
//     myPasswordController.dispose();
//     dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     var appState = context.watch<MyAppState>();

//     return Form(
//       key: formKey,
//       child: Column(
//         children: [
//           Text('ShopU'),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             child: TextFormField(
//               controller: myUsernameController,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), hintText: 'Enter username'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter username';
//                 }
//                 return null;
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             child: TextFormField(
//               controller: myPasswordController,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), hintText: 'Enter password'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter password';
//                 }
//                 return null;
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 var usernameText = Text(myUsernameController.text);
//                 var passwordText = Text(myPasswordController.text);
//                 // Validate returns true if the form is valid, or false otherwise.
//                 if (formKey.currentState!.validate()) {
//                   var isLogged =
//                       appState.userLogin(usernameText.data, passwordText.data);
//                   if (isLogged) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => HomeScreen(
//                                 username: myUsernameController.text)));
//                   }
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 var usernameText = Text(myUsernameController.text);
//                 var passwordText = Text(myPasswordController.text);
//                 // Validate returns true if the form is valid, or false otherwise.
//                 if (formKey.currentState!.validate()) {
//                   appState.isRegisteredUser(
//                       usernameText.data, passwordText.data);
//                 }
//               },
//               child: const Text('Register'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class RegisterPage extends StatelessWidget {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();

  void dispose() {
    myUsernameController.dispose();
    myPasswordController.dispose();
    dispose();
  }

  late final List<User> users;

  UsersService u = UsersService();

  String t() {
    var test = u.users();

    return "Register";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        t(),
      ),
    );
  }
}
