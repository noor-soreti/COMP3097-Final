import 'package:flutter/material.dart';
import 'package:mobile_app/models/shopping_list_model.dart';
import 'package:mobile_app/services/shopping_list_services.dart';
import 'package:provider/provider.dart';

import '../services/user_services.dart';
import '../widget/button_field.dart';

class MyList extends StatefulWidget {
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<ShoppingList> userList = [];
  bool _edit = false;

  @override
  void initState() {
    print("List Screen - initState()");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ShoppingListService>();
    var ctex = context.watch<UserService>();
    var currentUser = ctex.currentUser;

    void initList() async {
      await appState.getShoppingList(currentUser.username);
      userList = appState.list;
    }

    initList();

    void editBtn() {
      setState(() {
        // _edit = !_edit;
        print(!_edit);
      });
    }

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
              },
              // style:
            ),
          ],
        ),
        Expanded(
          child: userList.length > 0
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                          child: ListTile(
                              title: Text(userList[index].title),
                              trailing: !_edit
                                  ? Icon(null)
                                  : IconButton(
                                      onPressed: () {
                                        appState.deleteShoppingList(
                                            userList[index]);
                                      },
                                      icon: Icon(Icons.delete)))),
                    );
                  })
              : const Center(child: Text("No Items")),
        ),
      ],
    );
  }
}
