import 'package:bookingapp/pages/address/address.dart';
import 'package:bookingapp/pages/cart/bloc/cart_bloc.dart';
import 'package:bookingapp/pages/cart/bloc/data/cart_model.dart';
import 'package:bookingapp/pages/cart/widgets/cart_items.dart';
import 'package:bookingapp/pages/products/widgets/products_loading_shimmer.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/currency_format.dart';
import 'package:bookingapp/widgets/build_button.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  static const String myRoute = '/cart';
  @override
  Widget build(BuildContext context) {
    mContext = context;
    BlocProvider.of<CartBloc>(context).add(CartLoadEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer(
          bloc: BlocProvider.of<CartBloc>(context),
          listener: (context, state) {
            print("Cart State Changed");
          },
          builder: (context, state) {
            if (state is CartLoadingFailedState) {
              return _buildError(context, state.errorMsg);
            } else if (state is CartLoadedState) {
              return _buildBody(context, state.cartDatas);
            } else {
              return _buildLoading(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CartDatas cartDatas) {
    return Column(
      children: <Widget>[
        _buildHeaderSections(
          context,
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              buildCartItems(
                  context, cartDatas.items, MediaQuery.of(context).size.width)
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          color: AppTheme.secondaryGreenColor,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createNormalText('Gross Amount',
                      size: AppTheme.fontSizeS,
                      color: AppTheme.secondaryBlackColor),
                  createNormalText(
                    convertToCurrency(cartDatas.total.toString()),
                    size: AppTheme.fontSizeS,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createNormalText('VAT Amount',
                      size: AppTheme.fontSizeS,
                      color: AppTheme.secondaryBlackColor),
                  createNormalText(
                    convertToCurrency(cartDatas.total.toString()),
                    size: AppTheme.fontSizeS,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createNormalText('Shipping Cost',
                      size: AppTheme.fontSizeS,
                      color: AppTheme.secondaryBlackColor),
                  createNormalText(
                    convertToCurrency(cartDatas.shippingCost.toString()),
                    size: AppTheme.fontSizeS,
                  ),
                ],
              ),
              Divider(
                color: AppTheme.primaryGreenColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createNormalText('Net Amount',
                      size: AppTheme.fontSizeS,
                      color: AppTheme.secondaryBlackColor),
                  createNormalText(
                      convertToCurrency(cartDatas.total.toString()),
                      size: AppTheme.fontSizeS,
                      boldText: true),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              buildButton(
                  label: 'Proceed to Buy',
                  onPressed: proceed,
                  width: MediaQuery.of(context).size.width - 30),
            ],
          ),
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

  Widget _buildHeaderSections(BuildContext context) {
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
        createNormalText("Cart"),
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
        Expanded(child: showProductsLoadingShimmer()),
      ],
    );
  }

  BuildContext mContext;
  proceed() {
    Navigator.pushNamed(mContext, Address.myRoute);
  }
}
