import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/wiidgets/normal_text.dart';
import 'package:flutter/material.dart';

Widget buildCartIcon({String cartCount}) {
  return Container(
    height: 40,
    width: 40,
    child: Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.shopping_cart,
            size: AppTheme.iconSizeS,
            color: AppTheme.primaryBlueColor,
          ),
        ),
        cartCount == null
            ? Container()
            : cartCount == "0"
                ? Container()
                : Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 23,
                      width: 23,
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 23, color: AppTheme.yellowColor),
                          Align(
                            alignment: Alignment.topRight,
                            child: Center(
                              child: createNormalText(cartCount,
                                  size: AppTheme.fontSizeXXXS,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
      ],
    ),
  );
}
