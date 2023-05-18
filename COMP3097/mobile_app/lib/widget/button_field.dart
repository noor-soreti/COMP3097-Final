
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
