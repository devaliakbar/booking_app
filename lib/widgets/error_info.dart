import 'package:flutter/material.dart';

Widget buildErrorMsg(String errorMsg) {
  return Center(
    child: Text(
      errorMsg,
      style: TextStyle(color: Colors.red),
    ),
  );
}
