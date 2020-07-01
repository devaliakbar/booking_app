import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/currency_format.dart';
import 'package:bookingapp/wiidgets/loading_widget.dart';
import 'package:bookingapp/wiidgets/normal_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildProducts(List products, double screenWidth) {
  int productLenth = products.length;
  int noOfRows = 0;

  if (productLenth % 2 == 0) {
    noOfRows = (productLenth / 2).round();
  } else {
    noOfRows = ((productLenth + 1) / 2).round();
  }

  return Container(
    margin: EdgeInsets.only(left: 10),
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
          height: (286.0 * noOfRows),
          child: GridView.count(
            childAspectRatio: ((screenWidth / 2) - 10) / 278,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: List.generate(
              productLenth,
              (index) {
                return _buildProduct(index, products);
              },
            ),
          ),
        )
      ],
    ),
  );
}

Widget _buildProduct(int index, List products) {
  TextEditingController _qtyController = TextEditingController();
  _qtyController.text = products[index].cartQty.round().toString();
  return Container(
    margin: EdgeInsets.only(bottom: 10, right: 10),
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
            imageUrl: products[index].imagePath,
            placeholder: (context, url) => showLoading(),
            errorWidget: (context, url, error) => Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: createNormalText(
              products[index].name + ' / ' + products[index].brand,
              truncate: true),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: createNormalText(products[index].category,
              truncate: true,
              size: AppTheme.fontSizeS,
              color: AppTheme.blueFontColor),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: createNormalText(
              convertToCurrency(products[index].price.toString()),
              boldText: true,
              truncate: true),
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
                  onPressed: () {
                    int currentQty = int.parse(_qtyController.text);
                    if (currentQty != 0) {
                      currentQty--;
                    }
                    _qtyController.text = currentQty.toString();
                  },
                  color: Colors.black,
                  splashColor: AppTheme.lightBlackColor,
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
                  controller: _qtyController,
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
                  onPressed: () {
                    int currentQty = int.parse(_qtyController.text);
                    if (currentQty != 100) {
                      currentQty++;
                    }
                    _qtyController.text = currentQty.toString();
                  },
                  color: Colors.black,
                  splashColor: AppTheme.lightBlackColor,
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
                  createNormalText('ADD TO CART', size: AppTheme.fontSizeXS),
                ],
              ),
              onPressed: () {},
              color: Colors.white,
              elevation: 0,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
        )
      ],
    ),
  );
}
