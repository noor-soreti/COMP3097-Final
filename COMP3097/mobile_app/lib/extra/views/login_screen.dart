import 'package:flutter/material.dart';
import 'package:mobile_app/database/models.dart';
import 'package:mobile_app/extra/services/user_services.dart';
import 'package:mobile_app/extra/views/menu_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../src/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();

  Future<String?> getUser(String data) async {
    String result = "ok";
    try {
      // await UserDatabase.instance.getUser(data);
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<String?> _authLoginUser(BuildContext context, LoginData data) async {
    String? result;

    dynamic user = await _authService.emailLogin(data.name, data.password);
    // dynamic user = await _authService.signOut();

    if (user == null) {
      result = "Email or password incorrect";
    }

    // final loginData = await Provider.of<UserService>(context, listen: false)
    //     .userLogin(data.name, data.password);
    // if (loginData != "ok") // username or password incorrect
    // {
    //   result = "Username or password incorrect";
    // } else {
    //   Provider.of<UserService>(context, listen: false)
    //       .setCurrentUser(data.name)
    //       .then((value) => {
    //             Navigator.of(context).push(MaterialPageRoute(
    //                 builder: (contex) => SideMenu(username: data.name)))
    //           });
    // }
    return result;
  }

  Future<String?> _authSignupUser(BuildContext context, SignupData data) async {
    String? result = null;

    // User user = User(
    //     username: data.name.toString(), password: data.password.toString());
    // data.additionalSignupData?.forEach((key, value) {
    //   if (key == 'firstName') {
    //     user.firstname = value;
    //   }
    //   if (key == 'lastName') {
    //     user.lastname = value;
    //   }
    //   if (key == 'email') {
    //     user.email = value;
    //   }
    // });
    // final userExist = await Provider.of<UserService>(context, listen: false)
    //     .userExists(user.username);
    // if (userExist != "ok") // if user does not exist, then create user
    // {
    //   // ignore: use_build_context_synchronously
    //   Provider.of<UserService>(context, listen: false).createUser(user);
    // } else {
    //   result = "Username already in use";
    // }

    dynamic user = await _authService.registerUser(
        data.name.toString(), data.password.toString());
    if (user == null) {
      result = "Email already in use";
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
      onRecoverPassword: (_) => Future(() => getUser("username")),
      userType: LoginUserType.email,
      userValidator: (value) {
        if (value == null || value.isEmpty) {
          return "Username is empty";
        }
        return null;
      },
      onSubmitAnimationCompleted: () => {},
      // additionalSignupFields: [
      //   UserFormField(
      //       keyName: "firstName",
      //       displayName: "First Name",
      //       fieldValidator: (val) {
      //         if (val == null || val.isEmpty) {
      //           return "First name required";
      //         }
      //       }),
      //   UserFormField(
      //       keyName: "lastName",
      //       displayName: "Last Name",
      //       fieldValidator: (val) {
      //         if (val == null || val.isEmpty) {
      //           return "Last name required";
      //         }
      //       }),
      //   UserFormField(
      //       keyName: "email",
      //       displayName: "Email",
      //       fieldValidator: (val) {
      //         if (val == null || val.isEmpty) {
      //           return "Email required";
      //         }
      //       })
      // ],
      messages: LoginMessages(
        signUpSuccess: "Your account is now registered!",
      ),
      scrollable: true,
    );
  }
}
