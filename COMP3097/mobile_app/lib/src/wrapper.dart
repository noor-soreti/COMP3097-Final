import 'package:flutter/material.dart';
import 'package:mobile_app/src/models.dart';
import 'package:mobile_app/database/extra/models/user_model.dart';
import 'package:mobile_app/database/extra/services/user_services.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/src/authentication.dart';
import 'package:mobile_app/home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel?>(context);

    if (userModel == null) {
      return Authenticate();
    } else {
      return HomePage(
        userModel: userModel,
      );
    }
  }
}
