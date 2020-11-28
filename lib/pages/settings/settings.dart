import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String myRoute = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: createNormalText('oops! We\'re working on it'),
      ),
    );
  }
}
