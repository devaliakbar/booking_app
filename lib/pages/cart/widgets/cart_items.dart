import 'package:bookingapp/pages/product_detail/product_detail.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/currency_format.dart';
import 'package:bookingapp/widgets/loading_widget.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildCartItems(BuildContext context, List products, double screenWidth) {
  int productLenth = products.length;
  int noOfRows = 0;

  if (productLenth % 2 == 0) {
    noOfRows = (productLenth / 2).round();
  } else {
    noOfRows = ((productLenth + 1) / 2).round();
  }

  double singleContainerWidth = (screenWidth / 2) - 15;

  double totalProductDivHeight = (105 + singleContainerWidth) * noOfRows;

  double sigleContainerHeight = 85 + singleContainerWidth;

  return Container(
    margin: EdgeInsets.only(left: 15),
    height: totalProductDivHeight,
    child: GridView.count(
      childAspectRatio: singleContainerWidth / sigleContainerHeight,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(
        productLenth,
        (index) {
          return _buildProduct(context, index, products, singleContainerWidth);
        },
      ),
    ),
  );
}

Widget _buildProduct(
    BuildContext context, int index, List products, double containerWidth) {
  TextEditingController _qtyController = TextEditingController();
  _qtyController.text = products[index].cartQty.round().toString();
  return InkWell(
    onTap: () {
      Navigator.pushNamed(
        context,
        ProductDetail.myRoute,
        arguments: products[index].id,
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 10, right: 15),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: containerWidth,
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
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
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.close,
                        size: AppTheme.iconSizeS,
                      ),
                      onPressed: () {}),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: createNormalText(
                  products[index].name //+ ' / ' + products[index].brand
                  ,
                  truncate: true,
                  size: AppTheme.fontSizeXS),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                createNormalText(
                    convertToCurrency(products[index].price.toString()),
                    truncate: true,
                    boldText: true,
                    size: AppTheme.fontSizeXS),
                SizedBox(
                  width: 10,
                ),
                createNormalText("(Inc VAT)",
                    truncate: true,
                    boldText: true,
                    color: AppTheme.primaryGreenColor,
                    size: AppTheme.fontSizeXS),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 45.0,
                    height: 30.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      elevation: 0,
                      onPressed: () {
                        int currentQty = int.parse(_qtyController.text);
                        if (currentQty != 0) {
                          currentQty--;
                        }
                        _qtyController.text = currentQty.toString();
                      },
                      child: createNormalText('-',
                          color: Colors.black,
                          size: AppTheme.fontSizeS,
                          boldText: true),
                    ),
                  ),
                  Container(
                    width: 53.0,
                    height: 29,
                    child: TextField(
                      enabled: false,
                      controller: _qtyController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeXS,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(bottom: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 45.0,
                    height: 30.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      elevation: 0,
                      onPressed: () {
                        int currentQty = int.parse(_qtyController.text);
                        if (currentQty != 100) {
                          currentQty++;
                        }
                        _qtyController.text = currentQty.toString();
                      },
                      child: createNormalText('+',
                          color: Colors.black,
                          size: AppTheme.fontSizeS,
                          boldText: true),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Container(
          //     width: 148,
          //     padding: EdgeInsets.only(left: 5),
          //     child: RaisedButton(
          //       padding: EdgeInsets.only(right: 5),
          //       child: Row(
          //         children: <Widget>[
          //           Expanded(
          //             child: Center(
          //               child: createNormalText('Add To Cart',
          //                   size: AppTheme.fontSizeXS),
          //             ),
          //           ),
          //           Container(
          //             decoration: BoxDecoration(
          //               color: AppTheme.primaryGreenColor,
          //               borderRadius: BorderRadius.circular(3),
          //             ),
          //             margin: EdgeInsets.symmetric(vertical: 5),
          //             height: 30,
          //             width: 30,
          //             child: Icon(
          //               Icons.chevron_right,
          //               color: Colors.white,
          //             ),
          //           )
          //         ],
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(5),
          //         ),
          //       ),
          //       elevation: 0,
          //       onPressed: () {},
          //     ),
          //   ),
          // )
        ],
      ),
    ),
  );
}
