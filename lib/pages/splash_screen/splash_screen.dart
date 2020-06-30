import 'package:bookingapp/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  static const String myRoute = '/';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1500), () async {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Home.myRoute, (Route<dynamic> route) => false);
    });

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Jose"),
        ],
      ),
    ));
  }
}