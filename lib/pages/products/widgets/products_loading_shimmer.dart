import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget showProductsLoadingShimmer() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (BuildContext context, _) => _buildShimmingList(context),
  );
}

Widget _buildShimmingList(context) {
  return Container(
    height: 372,
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
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    height: 45,
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
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    height: 45,
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
