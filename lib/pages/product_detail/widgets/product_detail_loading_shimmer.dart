import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget showProductDetailLoadingShimmer(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    children: <Widget>[
      Expanded(
        child: ListView(
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                height: (screenWidth) * 0.75,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(left: 15, bottom: 10, right: 70),
                height: 11.0,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(left: 15, right: 90, bottom: 10),
                height: 11.0,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(left: 15, right: 100, bottom: 10),
                height: 11.0,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(left: 15, right: 120),
                height: 11.0,
              ),
            ),
          ],
        ),
      ),
      Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          height: 40.0,
        ),
      ),
      Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          height: 40.0,
        ),
      ),
      Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          height: 40.0,
        ),
      ),
    ],
  );
}
