import 'package:bookingapp/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PointSelected extends StatelessWidget {
  final double _margin = 8.0;
  final currentIndex;
  final int position;

  PointSelected({
    @required this.currentIndex,
    this.position = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.5),
        color: currentIndex == position
            ? AppTheme.primaryGreenColor
            : AppTheme.secondaryGreenColor,
      ),
      width: currentIndex == position ? 7 : 8,
      height: currentIndex == position ? 7 : 8,
      margin: EdgeInsets.only(
        left: _margin,
        right: _margin,
      ),
    );
  }
}
