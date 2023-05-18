import 'package:flutter/material.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _edit = false;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<UserService>();
    var currentUser = appState.currentUser.username;
    var userInfo = appState.getUserInfo(currentUser);
    var keys = userInfo.keys.toList();

    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Row(
          children: [
            TextButton(
              child: _edit == false
                  ? Text("Edit", style: TextStyle(fontWeight: FontWeight.w600))
                  : Text("Done"),
              onPressed: () {
                setState(() {
                  _edit = !_edit;
                });
              },
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 244, 244, 244),
          radius: 70,
          child: Icon(
            Icons.person,
            color: Color(0xffCCCCCC),
            size: 50,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 80, left: 20),
            itemCount: userInfo.keys.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 50,
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (keys[index] != 'password')
                          Text(
                            "${keys[index]}: ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        if (keys[index] != 'password')
                          Text(
                            "${(userInfo[keys[index]].toString())}: ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
