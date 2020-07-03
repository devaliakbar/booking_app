import 'package:flutter/material.dart';

showLoading() {
  return new Center(
    child: Container(
      height: 30,
      child: Image.asset(
        'assets/images/loading.gif',
        fit: BoxFit.scaleDown,
      ),
    ),
  );
}
