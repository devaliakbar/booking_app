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

  static final Color primaryColor = HexColor('#364159');
  static final Color secondaryColor = HexColor('#4F5A74');

  static final Color whiteLowColor = Colors.white10;

  static final Color blueColor = HexColor('#189EFF');

  static final Color lightFontColor = Colors.grey;
  static final Color fadeFontColor = HexColor('#F6F6F6');

  static final Color menuColor = HexColor('#6AD6F1');
  static final Color menuOrderColor = HexColor('#A092F0');
  static final Color topSellerColor = HexColor('#57D9A3');
  static final Color topCustomerColor = HexColor('#FF68B4');
  static final Color productListColor = HexColor('#FFD700');
  static final Color renameListColor = HexColor('#F88962');

  static final Color shopwareColorOne = HexColor('#8E7BF9');
  static final Color shopwareColorTwo = HexColor('#8369F8');
}
