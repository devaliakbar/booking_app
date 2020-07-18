import 'package:bookingapp/pages/home/main_home.dart';
import 'package:bookingapp/utility/hexcolor.dart';
import 'package:bookingapp/utility/statusbar_color.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  static const String myRoute = '/';
  @override
  Widget build(BuildContext context) {
    setUpStatusbarColor(backgroundColor: HexColor("#262223"), whiteColor: true);

    Timer(Duration(seconds: 2), () async {
      Navigator.of(context).pushNamedAndRemoveUntil(
          MainHome.myRoute, (Route<dynamic> route) => false);
    });

    return Scaffold(
      backgroundColor: HexColor("#262223"),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset('assets/images/belllab_logo.png'),
        ),
      ),
    );
  }
}
