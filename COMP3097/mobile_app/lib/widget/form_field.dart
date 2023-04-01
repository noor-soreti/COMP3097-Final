import 'package:flutter/material.dart';

class AppFormFields extends StatelessWidget {
  AppFormFields(
      {required this.controller,
      required this.validatorText,
      required this.hintText});

  final TextEditingController controller;
  final String hintText;
  final String validatorText;
  // final Text text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintText == null ? "null" : hintText),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $validatorText';
            }
            return null;
          }),
    );
  }
}
