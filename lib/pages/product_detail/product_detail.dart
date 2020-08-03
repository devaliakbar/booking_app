import 'package:bookingapp/pages/product_detail/bloc/data/product_detail_model.dart';
import 'package:bookingapp/pages/product_detail/bloc/product_detail_bloc.dart';
import 'package:bookingapp/pages/product_detail/widgets/product_detail_loading_shimmer.dart';

import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/currency_format.dart';
import 'package:bookingapp/widgets/build_button.dart';
import 'package:bookingapp/widgets/cart_icon.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/product_image/product_image.dart';

// ignore: must_be_immutable
class ProductDetail extends StatelessWidget {
  static const String myRoute = '/product_detail';
  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context).settings.arguments;

    BlocProvider.of<ProductDetailBloc>(context)
        .add(ProductDetailLoadEvent(productId));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer(
          bloc: BlocProvider.of<ProductDetailBloc>(context),
          listener: (context, state) {
            print("Home State Changed");
          },
          builder: (context, state) {
            if (state is ProductDetailLoadingFailedState) {
              return _buildError(context, state.errorMsg);
            } else if (state is ProductDetailLoadedState) {
              return _buildBody(context, state.productDetailDatas);
            } else {
              return _buildLoading(context);
            }
          },
        ),
      ),
    );
  }

  TextEditingController _qtyController = TextEditingController();

  Widget _buildBody(
      BuildContext context, ProductDetailModel productDetailDatas) {
    _qtyController.text = productDetailDatas.cartCount.round().toString();
    return Column(
      children: <Widget>[
        _buildHeaderSections(context,
            cartCount: productDetailDatas.cartCount.toString()),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ProductImage(productDetailDatas.imagesUrl),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: createNormalText(productDetailDatas.category,
                    color: AppTheme.secondaryBlackColor,
                    size: AppTheme.fontSizeS),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: createNormalText(productDetailDatas.productName,
                    size: AppTheme.fontSizeS, boldText: true),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: createNormalText(productDetailDatas.brand,
                    color: AppTheme.primaryGreenColor,
                    size: AppTheme.fontSizeS),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: createNormalText(productDetailDatas.description,
                    size: AppTheme.fontSizeXS),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: AppTheme.greyPrimaryColor,
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: createNormalText('Quantity',
                      size: AppTheme.fontSizeS,
                      color: AppTheme.secondaryBlackColor),
                ),
                Row(
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
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: AppTheme.greyPrimaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: <Widget>[
                  createNormalText('Price',
                      color: AppTheme.secondaryBlackColor,
                      size: AppTheme.fontSizeS),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            createNormalText('(Inc VAT)',
                                color: AppTheme.primaryGreenColor,
                                size: AppTheme.fontSizeXS),
                            SizedBox(
                              width: 10,
                            ),
                            createNormalText(
                                convertToCurrency(
                                  productDetailDatas.price.toString(),
                                ),
                                size: AppTheme.fontSizeS,
                                boldText: true),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: AppTheme.greyPrimaryColor,
              ),
            ),
            buildButton(
                label: 'Add to cart',
                onPrressed: addToCart,
                width: MediaQuery.of(context).size.width - 30),
            SizedBox(
              height: 15,
            )
          ],
        )
      ],
    );
  }

  Widget _buildError(BuildContext context, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeaderSections(context),
        Expanded(
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderSections(context),
        SizedBox(
          height: 15,
        ),
        Expanded(child: showProductDetailLoadingShimmer(context)),
      ],
    );
  }

  Widget _buildHeaderSections(BuildContext context, {String cartCount}) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 45,
          width: 60,
          child: RaisedButton(
              elevation: 0,
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(11),
                  topRight: Radius.circular(11),
                ),
              ),
              color: AppTheme.secondaryGreenColor,
              child: Icon(
                Icons.arrow_back_ios,
                size: AppTheme.iconSize,
                color: AppTheme.primaryGreenColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            child: createNormalText(
              "Product",
              truncate: true,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        buildCartIcon(context, cartCount: cartCount),
      ],
    );
  }

  addToCart() {
    print("Added to cart");
  }
}
