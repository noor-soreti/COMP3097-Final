import 'package:flutter/material.dart';
import 'package:mobile_app/src/models.dart';

class EditForm extends StatefulWidget {
  final User user;
  const EditForm({Key? key, required this.user}) : super(key: key);

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(widget.user.email);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.user.email,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: widget.user.firstname,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: widget.user.lastname,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: () => {{}}, child: Text("Update"))
            ],
          )),
    );
  }
}
