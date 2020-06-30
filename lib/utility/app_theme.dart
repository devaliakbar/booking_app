import 'package:bookingapp/utility/hexcolor.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const double mediumScreenSize = 684;
  static double screenHeight = 0;
  static String themeMode;

  static const double iconSizeXXXS = 13.0;
  static const double iconSizeXS = 17.0;
  static const double iconSizeS = 25.0;
  static const double iconSizeM = 31.0;
  static const double iconSizeL = 37.0;

  static double fontSizeXXXS = screenHeight > mediumScreenSize ? 11.5 : 9.0;
  static double fontSizeXXS = screenHeight > mediumScreenSize ? 13.5 : 11.0;
  static double fontSizeXS = screenHeight > mediumScreenSize ? 15.0 : 12.0;
  static double fontSizeS = screenHeight > mediumScreenSize ? 17.0 : 14.0;
  static double fontSizeM = screenHeight > mediumScreenSize ? 18.0 : 16.0;
  static double fontSizeL = screenHeight > mediumScreenSize ? 19.0 : 17.0;

  static final Color blueFontColor = HexColor('#4F5A74');

  static final Color yellowColor = Colors.yellow[800];
  static final Color greyBackgroundColor = Colors.grey[100];
}
