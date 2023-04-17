/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

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
  void initState() {
    print("Home Screen - initState()");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<UserService>();
    var userInfo = appState.getUserInfo(appState.currentUser.username);
    var keys = userInfo.keys.toList();

    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Row(
          children: [
            TextButton(
              child: _edit == false ? Text("Edit") : Text("Done"),
              onPressed: () {
                _edit = !_edit;
                print(_edit);
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
