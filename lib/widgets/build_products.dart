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
      margin: EdgeInsets.only(left: 10),
      height: (372.0 * noOfRows),
      child: GridView.count(
        childAspectRatio: ((screenWidth / 2) - 10) / 358,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: List.generate(
          productLenth,
          (index) {
            return _buildProduct(index, products, (screenWidth / 2) - 10);
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
    decoration: BoxDecoration(
      border: Border(
        left: BorderSide(
          width: 1.5,
          color: AppTheme.greyBackgroundColor,
        ),
      ),
      color: Colors.white,
    ),
    margin: EdgeInsets.only(bottom: 10, right: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Stack(
          children: [
            Container(
              height: containerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
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
              bottom: 7,
              left: 0,
              child: Stack(
                children: [
                  Container(
                    height: 30,
                    width: containerWidth - (containerWidth / 3),
                    child: CustomPaint(
                      painter: DrawTriangle(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 10,
                    ),
                    height: 30,
                    width: containerWidth - (containerWidth / 3),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: createNormalText(products[index].category,
                          size: AppTheme.fontSizeXS, truncate: true),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: createNormalText(
                products[index].name + ' / ' + products[index].brand,
                truncate: true,
                size: AppTheme.fontSizeXS),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: createNormalText(
                convertToCurrency(products[index].price.toString()),
                boldText: true,
                truncate: true,
                size: AppTheme.fontSizeS),
          ),
        ),
        Divider(
          color: AppTheme.lightBlackColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            createNormalText('Quantity', size: AppTheme.fontSizeXS),
            SizedBox(
              width: 33.0,
              height: 30.0,
              child: RaisedButton(
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
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
            ),
            Container(
              width: 33.0,
              height: 30,
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
                    borderSide: BorderSide(
                      color: AppTheme.primaryBlueColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 33.0,
              height: 30,
              child: RaisedButton(
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
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            child: createNormalText('ADD TO CART',
                color: Colors.white, size: AppTheme.fontSizeS),
            onPressed: () {},
            color: Colors.black,
            elevation: 0,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
