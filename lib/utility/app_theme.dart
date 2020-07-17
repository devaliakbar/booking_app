import 'package:bookingapp/utility/hexcolor.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const double mediumScreenSize = 684;
  static double screenHeight = 0;
  static String themeMode;

  static const double iconSizeS = 17.0;
  static const double iconSize = 23.0;

  static double fontSizeXXXS = screenHeight > mediumScreenSize ? 11.5 : 9.0;
  static double fontSizeXXS = screenHeight > mediumScreenSize ? 13.5 : 11.0;
  static double fontSizeXS = screenHeight > mediumScreenSize ? 15.0 : 12.0;
  static double fontSizeS = screenHeight > mediumScreenSize ? 17.0 : 14.0;
  static double fontSizeM = screenHeight > mediumScreenSize ? 18.0 : 16.0;
  static double fontSizeL = screenHeight > mediumScreenSize ? 19.0 : 17.0;
  static double fontSizeXL = screenHeight > mediumScreenSize ? 21.0 : 19.0;

  static final Color primaryGreenColor = HexColor('#74B04C');
  static final Color secondaryGreenColor = HexColor('#E1F8D6');

  static final Color secondaryBlackColor = HexColor("#858585");
  static final Color greyPrimaryColor = HexColor("#F0F0F0");

////OLD DELETE EMM ALL

  static final Color primaryBlueColor = HexColor('#14163C');

  static final Color secondaryBlueColor = HexColor('#A092F0');

  static final Color yellowColor = Colors.yellow[800];

  static final Color greyBackgroundColor = Colors.grey[100];

  static final Color lightBlackColor = HexColor("#545454");
}
