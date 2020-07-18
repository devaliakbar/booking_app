import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';

Widget buildCartIcon({String cartCount}) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    height: 45,
    width: 68,
    child: RaisedButton(
      onPressed: () {},
      elevation: 0,
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      color: AppTheme.primaryGreenColor,
      child: Row(
        mainAxisAlignment: cartCount == null
            ? MainAxisAlignment.center
            : cartCount == "0"
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.redeem,
            size: AppTheme.iconSize,
            color: Colors.white,
          ),
          cartCount == null
              ? Container(
                  width: 0,
                  height: 0,
                )
              : cartCount == "0"
                  ? Container(
                      width: 0,
                      height: 0,
                    )
                  : createNormalText(cartCount, color: Colors.white)
        ],
      ),
    ),
  );
}
