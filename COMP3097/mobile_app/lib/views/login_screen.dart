import 'package:flutter/material.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/menu_screen.dart';
import 'package:mobile_app/views/register.dart';
import 'package:mobile_app/widget/button_field.dart';
import 'package:mobile_app/widget/dialogue_field.dart';
import 'package:mobile_app/widget/form_field.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  List<User> uList = [];

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
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
          AppFormFields(
            controller: usernameController,
            validatorText: "Please enter username",
            hintText: "Enter username",
          ),
          AppFormFields(
              controller: passwordController,
              validatorText: "Please enter password",
              hintText: "Enter password"),
          ElevatedClassButton(
              childText: "Submit",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  var isLogged = appState
                      .userExists(usernameController.text)
                      .then((value) => {
                            print(value),
                            if (value == 'ok')
                              {
                                print("printing"),
                                appState
                                    .getUser(usernameController.text)
                                    .then((value) => {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (contex) => SideMenu(
                                                      username:
                                                          usernameController
                                                              .text)))
                                        })
                              }
                            else
                              {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DialogueField(
                                          alert: "Oops",
                                          content:
                                              "Username or password incorrect",
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          btnText: 'ok',
                                        ))
                              }
                          });
                }
              }),
          ElevatedClassButton(
              childText: "Register",
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              })
        ],
      ),
    );
  }
}
