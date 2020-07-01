import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/wiidgets/loading_widget.dart';
import 'package:bookingapp/wiidgets/normal_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildProducts(List products) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: createNormalText('Products'),
        ),
        SizedBox(
          height: 7,
        ),
        Container(
          height: (288.0 * 3),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (_, __) => _buildListItem(),
          ),
        )
      ],
    ),
  );
}

Widget _buildListItem() {
  _searchController.text = "0";
  return Container(
    height: 278,
    margin: EdgeInsets.only(bottom: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.greyBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    imageUrl:
                        "https://www.kindpng.com/picc/m/244-2441559_adidas-yeezy-boost-350-turtle-dove-transparent-background.png",
                    placeholder: (context, url) => showLoading(),
                    errorWidget: (context, url, error) => Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: createNormalText('Yeezy / Addidas', truncate: true),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: createNormalText('Category Name',
                      truncate: true,
                      size: AppTheme.fontSizeS,
                      color: AppTheme.blueFontColor),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: createNormalText('\$400.00',
                      boldText: true, truncate: true),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 43.0,
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: createNormalText('-',
                              color: Colors.white,
                              size: AppTheme.fontSizeS,
                              boldText: true),
                          onPressed: () {},
                          color: Colors.black,
                          splashColor: AppTheme.yellowColor,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 43.0,
                        height: 40,
                        child: TextField(
                          enabled: false,
                          controller: _searchController,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(bottom: 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      SizedBox(
                        width: 43.0,
                        height: 40,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: createNormalText('+',
                              color: Colors.white,
                              size: AppTheme.fontSizeS,
                              boldText: true),
                          onPressed: () {},
                          color: Colors.black,
                          splashColor: AppTheme.yellowColor,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 120.0,
                    height: 40.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.black, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_shopping_cart,
                            size: AppTheme.iconSizeXS,
                          ),
                          SizedBox(
                            width: 1.5,
                          ),
                          createNormalText('ADD TO CART',
                              size: AppTheme.fontSizeXS),
                        ],
                      ),
                      onPressed: () {},
                      color: Colors.white,
                      splashColor: AppTheme.yellowColor,
                      elevation: 0,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    ),
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
              color: AppTheme.greyBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    imageUrl:
                        "https://www.kindpng.com/picc/m/244-2441559_adidas-yeezy-boost-350-turtle-dove-transparent-background.png",
                    placeholder: (context, url) => showLoading(),
                    errorWidget: (context, url, error) => Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: createNormalText('Yeezy / Addidas', truncate: true),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: createNormalText('Category Name',
                      truncate: true,
                      size: AppTheme.fontSizeS,
                      color: AppTheme.blueFontColor),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: createNormalText('\$400.00',
                      boldText: true, truncate: true),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 43.0,
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: createNormalText('-',
                              color: Colors.white,
                              size: AppTheme.fontSizeS,
                              boldText: true),
                          onPressed: () {},
                          color: Colors.black,
                          splashColor: AppTheme.yellowColor,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 43.0,
                        height: 40,
                        child: TextField(
                          enabled: false,
                          controller: _searchController,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(bottom: 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      SizedBox(
                        width: 43.0,
                        height: 40,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: createNormalText('+',
                              color: Colors.white,
                              size: AppTheme.fontSizeS,
                              boldText: true),
                          onPressed: () {},
                          color: Colors.black,
                          splashColor: AppTheme.yellowColor,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 120.0,
                    height: 40.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.black, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_shopping_cart,
                            size: AppTheme.iconSizeXS,
                          ),
                          SizedBox(
                            width: 1.5,
                          ),
                          createNormalText('ADD TO CART',
                              size: AppTheme.fontSizeXS),
                        ],
                      ),
                      onPressed: () {},
                      color: Colors.white,
                      splashColor: AppTheme.yellowColor,
                      elevation: 0,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    ),
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

TextEditingController _searchController = TextEditingController();
