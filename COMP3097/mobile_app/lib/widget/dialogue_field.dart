/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

import 'package:flutter/material.dart';

class DialogueField extends StatelessWidget {
  DialogueField(
      {required this.alert,
      required this.content,
      required this.onPressed,
      required this.btnText});

  final String alert;
  final String content;
  final Function onPressed;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(alert),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => {onPressed()},
          child: Text(btnText),
        ),
      ],
    );
  }
}
