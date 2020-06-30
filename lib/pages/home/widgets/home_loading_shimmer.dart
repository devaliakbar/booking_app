import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget showHomeLoadingShimmer() {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 7,
      ),
      Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 150.0,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              margin: EdgeInsets.only(left: 10, bottom: 10),
              height: 10,
              width: 70,
              color: Colors.white,
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              margin: EdgeInsets.only(right: 10, bottom: 10),
              height: 10,
              width: 70,
              color: Colors.white,
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              margin: EdgeInsets.only(right: 10, bottom: 10),
              height: 10,
              width: 70,
              color: Colors.white,
            ),
          ),
        ),
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
    height: 300,
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
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 80,
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
                    height: 60,
                    color: Colors.white,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    height: 60,
                    color: Colors.white,
                  ),
                )
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
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 80,
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
                    height: 50,
                    color: Colors.white,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    height: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
