import 'package:flutter/material.dart';
import 'package:mobile_app/database/models.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/services/product_service.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/menu_screen.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:mobile_app/database/user_database.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // database.getAllUsers();
    super.initState();
  }

  Future<String?> getUser(String data) async {
    String result = "ok";
    try {
      await UserDatabase.instance.getUser(data);
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<String?> _authLoginUser(BuildContext context, LoginData data) async {
    String? result = null;
    final loginData = await Provider.of<UserService>(context, listen: false)
        .userLogin(data.name, data.password);

    if (loginData != "ok") // username or password incorrect
    {
      result = "Username or password incorrect";
    } else {
      Provider.of<UserService>(context, listen: false)
          .setCurrentUser(data.name)
          .then((value) => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (contex) => SideMenu(username: data.name)))
              });
    }
    return result;
  }

  Future<String?> _authSignupUser(BuildContext context, SignupData data) async {
    String? result = null;

    User user = User(
        username: data.name.toString(), password: data.password.toString());

    data.additionalSignupData?.forEach((key, value) {
      if (key == 'firstName') {
        user.firstname = value;
      }
      if (key == 'lastName') {
        user.lastname = value;
      }
      if (key == 'email') {
        user.email = value;
      }
    });

    final userExist = await Provider.of<UserService>(context, listen: false)
        .userExists(user.username);

    if (userExist != "ok") // if user does not exist, then create user
    {
      // ignore: use_build_context_synchronously
      Provider.of<UserService>(context, listen: false).createUser(user);
    } else {
      result = "Username already in use";
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // var appState = context.watch<UserService>();

    return FlutterLogin(
      title: 'ShopU',
      key: formKey,
      onLogin: (LoginData data) => _authLoginUser(context, data),
      onSignup: (SignupData data) => _authSignupUser(context, data),
      // onSubmitAnimationCompleted: () {
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => SideMenu(
      //       username: appState.currentUser.username,
      //     ),
      //   ));
      // },
      onRecoverPassword: (_) => Future(() => getUser("username")),
      userType: LoginUserType.name,
      userValidator: (value) {
        if (value == null || value.isEmpty) {
          return "Username is empty";
        }
        return null;
      },
      additionalSignupFields: [
        UserFormField(
            keyName: "firstName",
            displayName: "First Name",
            fieldValidator: (val) {
              if (val == null || val.isEmpty) {
                return "First name required";
              }
            }),
        UserFormField(
            keyName: "lastName",
            displayName: "Last Name",
            fieldValidator: (val) {
              if (val == null || val.isEmpty) {
                return "Last name required";
              }
            }),
        UserFormField(
            keyName: "email",
            displayName: "Email",
            fieldValidator: (val) {
              if (val == null || val.isEmpty) {
                return "Email required";
              }
            })
      ],
      messages: LoginMessages(
        signUpSuccess: "Your account is now registered!",
      ),
      // additionalSignupFields: [
      //   UserFormField(
      //       keyName: 'firstname',
      //       displayName: 'First Name',
      //       fieldValidator: (value) {
      //         print(value);
      //       }),
      //   UserFormField(
      //       keyName: 'lastname',
      //       displayName: 'Last Name',
      //       fieldValidator: (value) {
      //         print(value);
      //       }),
      //   UserFormField(
      //       keyName: 'email',
      //       userType: LoginUserType.email,
      //       fieldValidator: (value) {
      //         print(value);
      //       })
      // ],
      scrollable: true,
    );

    //return Form(
    //   key: formKey,
    //   child: Column(
    //     children: [
    //       Text('Sign In'),
    //       AppFormFields(
    //           controller: usernameController,
    //           validatorText: "Please enter username",
    //           hintText: "Enter username"),
    //       AppFormFields(
    //         controller: passwordController,
    //         validatorText: "Please enter password",
    //         hintText: "Enter password",
    //         obscureText: true,
    //       ),
    //       ElevatedClassButton(
    //           childText: "Submit",
    //           onPressed: () {
    //             if (formKey.currentState!.validate()) {
    // var isLogged = appState
    //     .userLogin(
    //         usernameController.text, passwordController.text)
    //     .then((value) => {
    //  if (value == 'ok')
    //     {
    //       appState
    //           .getUser(usernameController.text)
    //           .then((value) => {
    //                 Navigator.of(context).push(
    //                     MaterialPageRoute(
    //                         builder: (contex) => SideMenu(
    //                             username:
    //                                 usernameController
    //                                     .text)))
    //               })
    //     }
    //           else
    //             {
    //               showDialog<String>(
    //                   context: context,
    //                   builder: (BuildContext context) =>
    //                       DialogueField(
    //                         alert: "Oops",
    //                         content:
    //                             "Username or password incorrect",
    //                         onPressed: () {
    //                           Navigator.pop(context);
    //                         },
    //                         btnText: 'ok',
    //                       ))
    //             }
    //         });
    //             }
    //           }),
    //       ElevatedClassButton(
    //           childText: "Register",
    //           onPressed: () {
    //             Navigator.of(context).push(
    //                 MaterialPageRoute(builder: (context) => RegisterPage()));
    //           })
    //     ],
    //   ),
    // );
  }
}
