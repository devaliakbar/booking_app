import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/wiidgets/loading_widget.dart';
import 'package:bookingapp/wiidgets/normal_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildProducts(List products) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: ListView(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: createNormalText('Products'),
        ),
        SizedBox(
          height: 7,
        ),
        _buildListItem(),
        _buildListItem(),
        _buildListItem()
      ],
    ),
  );
}

Widget _buildListItem() {
  _searchController.text = "0";
  return Container(
    height: 285,
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
                      ButtonTheme(
                        minWidth: 43.0,
                        height: 43.0,
                        child: RaisedButton(
                          child: createNormalText('-',
                              color: Colors.white, size: AppTheme.fontSizeL),
                          onPressed: () {},
                          color: Colors.black,
                          splashColor: AppTheme.yellowColor,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                      ),
                      SizedBox(
                        width: 1.5,
                      ),
                      Container(
                        width: 43.0,
                        height: 43,
                        child: TextField(
                          enabled: false,
                          controller: _searchController,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.5,
                      ),
                      ButtonTheme(
                        minWidth: 43.0,
                        height: 43.0,
                        child: RaisedButton(
                          child: createNormalText('+',
                              color: Colors.white, size: AppTheme.fontSizeL),
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
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ButtonTheme(
                    minWidth: 100.0,
                    height: 43.0,
                    child: RaisedButton(
                      child: createNormalText(
                        'Add To Cart',
                        color: Colors.white,
                      ),
                      onPressed: () {},
                      color: AppTheme.yellowColor,
                      splashColor: Colors.black87,
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
                      ButtonTheme(
                        minWidth: 43.0,
                        height: 43.0,
                        child: RaisedButton(
                          child: createNormalText('-',
                              color: Colors.white, size: AppTheme.fontSizeL),
                          onPressed: () {},
                          color: Colors.black,
                          splashColor: AppTheme.yellowColor,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                      ),
                      SizedBox(
                        width: 1.5,
                      ),
                      Container(
                        width: 43.0,
                        height: 43,
                        child: TextField(
                          enabled: false,
                          controller: _searchController,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.5,
                      ),
                      ButtonTheme(
                        minWidth: 43.0,
                        height: 43.0,
                        child: RaisedButton(
                          child: createNormalText('+',
                              color: Colors.white, size: AppTheme.fontSizeL),
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
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ButtonTheme(
                    minWidth: 100.0,
                    height: 43.0,
                    child: RaisedButton(
                      child: createNormalText(
                        'Add To Cart',
                        color: Colors.white,
                      ),
                      onPressed: () {},
                      color: AppTheme.yellowColor,
                      splashColor: Colors.black87,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    ),
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

TextEditingController _searchController = TextEditingController();
