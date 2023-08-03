import 'package:flutter/material.dart';
import 'package:mobile_app/auth/auth_service.dart';
import 'package:mobile_app/src/user_notifier.dart';
import 'package:provider/provider.dart';

import '../src/models.dart';
import 'edit_form.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;

  @override
  void initState() {
    initUser();
    super.initState();
  }

  Future initUser() async {
    user = Provider.of<UserNotifier>(context, listen: false).currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserNotifier>(
      builder: (context, value, child) {
        return Column(children: [
          const SizedBox(
            height: 55,
          ),
          CircleAvatar(
              radius: 70,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Color.fromARGB(255, 244, 244, 244),
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
              )),
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
                      value.currentUser.email,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Full name: ",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "${value.currentUser.firstname} ${value.currentUser.lastname}",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditForm(user: user!)));
                    },
                    child: Text('Edit'))
              ],
            ),
          ),
        ]);
      },
    );
  }
}
