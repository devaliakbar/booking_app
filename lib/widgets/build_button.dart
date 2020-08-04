import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';

Widget buildButton(
    {@required String label,
    @required Function onPressed,
    @required double width}) {
  return SizedBox(
    width: width,
    height: 50,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: AppTheme.primaryGreenColor,
      onPressed: onPressed,
      child: createNormalText(label, color: Colors.white),
    ),
  );
}
