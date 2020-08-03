import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  static const String myRoute = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: createNormalText('hEROKU'),
      ),
    );
  }
}
