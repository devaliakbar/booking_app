import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget showHomeLoadingShimmer() {
  return Column(
    children: <Widget>[
      Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 140.0,
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                height: 10,
                width: 130,
                color: Colors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Container(
                height: 10,
                width: 70,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 7),
        height: 73,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 13),
              width: 68,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 13),
              width: 68,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 13),
              width: 68,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 13),
              width: 68,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 13),
              width: 68,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 13),
              width: 68,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 13),
              width: 68,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: 15),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              margin: EdgeInsets.only(right: 10, bottom: 10),
              height: 10,
              width: 130,
              color: Colors.white,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, _) => _buildShimmingList(context),
        ),
      )
    ],
  );
}

Widget _buildShimmingList(context) {
  return Container(
    height: 323,
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    height: 10,
                    color: Colors.white,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    height: 10,
                    color: Colors.white,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    height: 45,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    height: 10,
                    color: Colors.white,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    height: 10,
                    color: Colors.white,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    height: 45,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
