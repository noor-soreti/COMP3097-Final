/// *******************************************************************************
/// Project: recipe App
/// Assignment: COMP3097 Final Assignment
/// Author(s): Noor Ranya Said-101358069
/// //         Hui Qiu -100675355
///*******************************************************************************

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text("ShopU"),
                ),
                body: LoginPage(),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0, left: 50),
          child: Text(
            "Noor Ranya Said - 101358069 \n\nHui Qui - 100675355",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black, decoration: TextDecoration.none ),
          ),
        ));
  }
}
