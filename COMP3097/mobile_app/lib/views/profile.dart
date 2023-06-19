import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/services/user_services.dart';
import 'package:provider/provider.dart';

import '../database/models.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _edit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<User> getUserInfo() async {
    return Provider.of<UserService>(context, listen: false).currentUser;
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<UserService>();
    var currentUser = appState.currentUser;

    // var keys = userInfo.keys.toList();

    return Column(children: [
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
        child: ListView(
          padding: const EdgeInsets.only(top: 80, left: 20),
          children: [
            Row(
              children: [
                Text(
                  "Username: ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  currentUser.username,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Password: ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "**password** ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Email: ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  currentUser.email.toString(),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "First Name: ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  currentUser.firstname.toString(),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Last Name: ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  currentUser.lastname.toString(),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            )
          ],
        ),
      )
    ]);
  }
}
