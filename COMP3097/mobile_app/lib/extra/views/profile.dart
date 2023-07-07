import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/extra/services/shopping_list_services.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/src/auth_service.dart';
import 'package:mobile_app/src/user_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final AuthService _authService = AuthService();

  final UserService userService = UserService();

  late String email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    email = _authService.currentUser()!.email!;
    return Column(children: [
      const SizedBox(
        height: 55,
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
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          children: [
            Row(
              children: [
                Text(
                  "Email: ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  email,
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
            ElevatedButton(onPressed: () => {}, child: Text('Edit'))
          ],
        ),
      ),
    ]);
  }
}
