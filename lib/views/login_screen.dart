import 'package:flutter/material.dart';
import 'package:mobile_app/service/user_service.dart';
import 'package:flutter_login/flutter_login.dart';

import '../auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final UserService _service = UserService();

  Future<String?> getUser(String data) async {
    String result = "ok";
    try {} catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<String?> _authLoginUser(BuildContext context, LoginData data) async {
    String? result;

    dynamic user = await _authService.emailLogin(data.name, data.password);

    return user == null ? "Email or password incorrect" : result;
  }

  Future<String?> _authSignupUser(BuildContext context, SignupData data) async {
    String? result;

    dynamic user = await _authService.registerUser(
        data.name.toString(), data.password.toString());

    var newUser = <String, dynamic>{
      'email': data.name,
      'firstname': data.additionalSignupData!['firstname'],
      'lastname': data.additionalSignupData!['lastname'],
      'product': []
    };

    await _service.addUser(newUser);

    return user == null ? "Email already in use" : result;
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
      additionalSignupFields: [
        UserFormField(
            keyName: "firstname",
            displayName: "First Name",
            fieldValidator: (val) {
              if (val == null || val.isEmpty) {
                return "First name required";
              }
            }),
        UserFormField(
            keyName: "lastname",
            displayName: "Last Name",
            fieldValidator: (val) {
              if (val == null || val.isEmpty) {
                return "Last name required";
              }
            }),
      ],
      messages: LoginMessages(
        signUpSuccess: "Your account is now registered!",
      ),
    );
  }
}
