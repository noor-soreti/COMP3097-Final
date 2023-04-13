
import 'package:flutter/material.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<UserService>();
    var userInfo = appState.getUserInfo(appState.currentUser.username);
    var keys = userInfo.keys.toList();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 80, left: 20),

      itemCount: userInfo.keys.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: Column(
            children: [
              Row(
                children: [
                  Text("${keys[index]}: "),
                  Text(userInfo[keys[index]].toString())
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
