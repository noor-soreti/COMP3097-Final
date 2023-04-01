import 'package:flutter/material.dart';
import 'package:mobile_app/database/user_database.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/menu_screen.dart';
import 'package:mobile_app/widget/button_field.dart';
import 'package:mobile_app/widget/dialogue_field.dart';
import 'package:mobile_app/widget/form_field.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();

  List<User> uList = [];

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var appState = context.watch<UserService>();

    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Register "),
              AppFormFields(
                controller: firstname,
                hintText: "Enter first name",
                validatorText: "firstname",
              ),
              AppFormFields(
                controller: lastname,
                hintText: "Enter last name",
                validatorText: "lastname",
              ),
              AppFormFields(
                controller: username,
                hintText: "Enter username",
                validatorText: "username",
              ),
              AppFormFields(
                controller: password,
                hintText: "Enter password",
                validatorText: "password",
              ),
              AppFormFields(
                controller: email,
                hintText: "Enter email",
                validatorText: "email",
              ),
              ElevatedClassButton(
                  childText: "Submit",
                  onPressed: () {
                    User newUser = User(
                        username: username.text,
                        password: password.text,
                        firstname: firstname.text,
                        lastname: lastname.text,
                        email: email.text);
                    if (formKey.currentState!.validate()) {
                      appState.userExists(username.text).then((value) => {
                            if (value != 'ok')
                              {
                                appState.createUser(newUser).then((value) => {
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              DialogueField(
                                                alert: "Success",
                                                content:
                                                    "You will be sent back to login",
                                                onPressed: () {
                                                  var nav =
                                                      Navigator.of(context);
                                                  nav.pop();
                                                  nav.pop();
                                                },
                                                btnText: 'Return',
                                              ))
                                    })
                              }
                            else
                              {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DialogueField(
                                          alert: "Oops",
                                          content: "Username already exists",
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          btnText: 'Ok',
                                        ))
                              }
                          });
                    }
                  })
            ],
          ),
        ));
  }
}


/*
Form(
        key: formKey,
        child: Column(
          children: [
            Text("Register"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text("hello"),
            )
          ],
        ));
*/