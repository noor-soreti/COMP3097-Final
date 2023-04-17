/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

import 'package:flutter/material.dart';

class ElevatedClassButton extends StatelessWidget {
  ElevatedClassButton({required this.childText, required this.onPressed});

  final String childText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          onPressed: () => {onPressed()},
          child: Text(childText),
        ));
  }
}
