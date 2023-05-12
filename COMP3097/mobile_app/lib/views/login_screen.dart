/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

import 'package:flutter/material.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:mobile_app/views/home_screen.dart';
import 'package:mobile_app/views/menu_screen.dart';
import 'package:mobile_app/widget/dialogue_field.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:mobile_app/database/user_database.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<String?> getUser(String data) async {
    String result = "ok";
    print("he");
    try {
      await UserDatabase.instance.getUser(data);
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<String?> _authLoginUser(BuildContext context, LoginData data) async {
    Provider.of<UserService>(context, listen: false)
        .userLogin(data.name, data.password)
        .then((value) => {
              if (value != 'ok')
                {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => DialogueField(
                            alert: "Oops",
                            content: "Username or password incorrect",
                            onPressed: () {
                              // Navigator.pop(context);
                            },
                            btnText: 'ok',
                          ))
                }
              else
                {
                  Provider.of<UserService>(context, listen: false)
                      .getUser(data.name)
                      .then((value) => {
                            print("hello"),
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (contex) =>
                                    SideMenu(username: data.name)))
                          })
                }
            });

    // .then((value) => {
    //       if (value == 'ok')
    //         {null}
    //       else
    //         {
    //           showDialog<String>(
    //               context: context,
    //               builder: (BuildContext context) => DialogueField(
    //                     alert: "Oops",
    //                     content: "Username or password incorrect",
    //                     onPressed: () {
    //                       Navigator.pop(context);
    //                     },
    //                     btnText: 'ok',
    //                   ))
    //         }
    //     }
    // );
  }

  Future<String?> _authSignupUser(BuildContext context, SignupData data) async {
    User newUser = User(
        password: data.password.toString(), username: data.name.toString());
    Provider.of<UserService>(context, listen: false)
        .userExists(newUser.username)
        .then((value) => {
              if (value != 'ok')
                {
                  Provider.of<UserService>(context, listen: false)
                      .createUser(newUser)
                      .then((value) => print("success"))
                  //.then((value) => {
                  //       showDialog<String>(
                  //           context: context,
                  //           builder: (BuildContext context) => DialogueField(
                  //                 alert: "Success",
                  //                 content: "You will be sent back to login",
                  //                 onPressed: () {
                  //                   var nav = Navigator.of(context);
                  //                   nav.pop();
                  //                 },
                  //                 btnText: 'Return',
                  //               ))
                  //     })
                }
              else
                {
                  // showDialog<String>(
                  //     context: context,
                  //     builder: (BuildContext context) => DialogueField(
                  //           alert: "Oops",
                  //           content: "Username already exists",
                  //           onPressed: () {},
                  //           btnText: 'Ok',
                  //         ))
                }
            });
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
      loginAfterSignUp: false,
      onRecoverPassword: (_) => Future(() => getUser("username")),
      userType: LoginUserType.name,
      userValidator: (value) {
        if (value == null || value.isEmpty) {
          return "Username is empty";
        }
        return null;
      },
      messages: LoginMessages(signUpSuccess: "Your account is now registered!"),
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
