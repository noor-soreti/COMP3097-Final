/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

import 'package:flutter/material.dart';

class AppFormFields extends StatelessWidget {
  AppFormFields(
      {required this.controller,
      required this.validatorText,
      required this.hintText,
      this.obscureText});

  final TextEditingController controller;
  final String hintText;
  final String validatorText;
  bool? obscureText;
  // final Text text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
          obscureText: obscureText ?? false,
          controller: controller,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: hintText),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $validatorText';
            }
            return null;
          }),
    );
  }
}
