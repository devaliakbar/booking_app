import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';

Widget buildSearchField() {
  return Container(
    decoration: BoxDecoration(
      color: AppTheme.greyPrimaryColor,
      borderRadius: BorderRadius.circular(
        15,
      ),
    ),
    margin: EdgeInsets.symmetric(horizontal: 15),
    height: 55,
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 25,
        ),
        Icon(
          Icons.search,
          color: AppTheme.primaryGreenColor,
        ),
        SizedBox(
          width: 10,
        ),
        createNormalText('Search',
            size: AppTheme.fontSizeS, color: AppTheme.secondaryBlackColor)
      ],
    ),
  );
}
