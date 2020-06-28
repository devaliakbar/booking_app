import 'package:bookingapp/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking App',
      routes: {SplashScreen.myRoute: (BuildContext context) => SplashScreen()},
    );
  }
}
