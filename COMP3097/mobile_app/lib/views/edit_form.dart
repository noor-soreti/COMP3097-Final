import 'package:flutter/material.dart';
import 'package:mobile_app/src/models.dart';

import '../src/user_service.dart';

class EditForm extends StatefulWidget {
  final User user;
  const EditForm({Key? key, required this.user}) : super(key: key);

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final UserService _service = UserService();
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User u;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController..text = widget.user.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: firstnameController..text = widget.user.firstname,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lastnameController..text = widget.user.lastname,
                // onChanged: (value) => {print(lastnameController.text)},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () => {
                        u = User(
                            email: emailController.text,
                            firstname: firstnameController.text,
                            lastname: lastnameController.text),
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Confirm'),
                            content: const Text('Save Changes?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  var nav = Navigator.of(context);
                                  nav.pop();
                                  nav.pop();
                                },
                                child: const Text('Save'),
                              ),
                            ],
                          ),
                        ),
                        _service.update(u)
                      },
                  child: Text("Update"))
            ],
          )),
    );
  }
}
