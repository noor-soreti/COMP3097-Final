import 'package:flutter/material.dart';
import 'package:mobile_app/src/user_model.dart';
import 'package:mobile_app/src/authentication.dart';
import 'package:mobile_app/home_page.dart';
import 'package:mobile_app/src/user_notifier.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel?>(context);

    if (userModel == null) {
      return Authenticate();
    } else {
      return HomePage(userModel: userModel);
      // ChangeNotifierProvider(create: (context) => UserNotifier()),
    }
  }
}
