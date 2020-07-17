import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/currency_format.dart';
import 'package:bookingapp/utility/hexcolor.dart';
import 'package:bookingapp/widgets/loading_widget.dart';
import 'package:bookingapp/widgets/normal_text.dart';
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
    color: Colors.white,
    child: Container(
      margin: EdgeInsets.only(left: 15),
      height: (338.0 * noOfRows),
      child: GridView.count(
        childAspectRatio: ((screenWidth / 2) - 15) / 323,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: List.generate(
          productLenth,
          (index) {
            return _buildProduct(index, products, (screenWidth / 2) - 15);
          },
        ),
      ),
    ),
  );
}

Widget _buildProduct(int index, List products, double containerWidth) {
  TextEditingController _qtyController = TextEditingController();
  _qtyController.text = products[index].cartQty.round().toString();
  return Container(
    margin: EdgeInsets.only(bottom: 10, right: 15),
    child: Column(
      children: <Widget>[
        Stack(
          children: [
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
            // Positioned(
            //   bottom: 7,
            //   left: 0,
            //   child: Stack(
            //     children: [
            //       Container(
            //         height: 30,
            //         width: containerWidth - (containerWidth / 3),
            //         child: CustomPaint(
            //           painter: DrawTriangle(),
            //         ),
            //       ),
            //       Container(
            //         padding: EdgeInsets.only(
            //           left: 5,
            //           right: 10,
            //         ),
            //         height: 30,
            //         width: containerWidth - (containerWidth / 3),
            //         child: Align(
            //           alignment: Alignment.centerLeft,
            //           child: createNormalText(products[index].category,
            //               size: AppTheme.fontSizeXS, truncate: true),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: createNormalText(
                products[index].name + ' / ' + products[index].brand,
                truncate: true,
                size: AppTheme.fontSizeXS),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: createNormalText(
                convertToCurrency(products[index].price.toString()),
                truncate: true,
                boldText: true,
                color: AppTheme.primaryGreenColor,
                size: AppTheme.fontSizeXS),
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
                      color: AppTheme.primaryBlueColor,
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
        SizedBox(
          height: 3,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 148,
            padding: EdgeInsets.only(left: 5),
            child: RaisedButton(
              padding: EdgeInsets.only(right: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: createNormalText('Add To Cart',
                          size: AppTheme.fontSizeXS),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreenColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              elevation: 0,
              onPressed: () {},
            ),
          ),
        )
      ],
    ),
  );
  ;
}

class DrawTriangle extends CustomPainter {
  Paint _paint;

  DrawTriangle() {
    _paint = Paint()
      ..color = HexColor("#cccccc").withOpacity(0.5)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - (size.width / 5), size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
