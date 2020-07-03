import 'package:bookingapp/pages/home/bloc/data/home_model.dart';
import 'package:bookingapp/pages/home/bloc/home_bloc.dart';
import 'package:bookingapp/pages/home/widgets/build_category.dart';
import 'package:bookingapp/widgets/build_products.dart';
import 'package:bookingapp/pages/home/widgets/home_loading_shimmer.dart';
import 'package:bookingapp/pages/home/widgets/slider.dart';
import 'package:bookingapp/pages/products/product_helper.dart';
import 'package:bookingapp/pages/products/products.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/cart_icon.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:bookingapp/widgets/search_interface/search_interface.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final Function toggleMenu;
  Home(this.toggleMenu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer(
          bloc: BlocProvider.of<HomeBloc>(context),
          listener: (context, state) {
            print("Home State Changed");
          },
          builder: (context, state) {
            if (state is HomeLoadingFailedState) {
              return _buildError(state.errorMsg, context);
            } else if (state is HomeLoadedState) {
              return _buildBody(state.homePageDatas, context);
            } else {
              return _buildLoading(context);
            }
          },
        ),
      ),
    );
  }

//ERROR WIDGET
  Widget _buildError(String text, BuildContext context) {
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

//MAIN BODY
  Widget _buildBody(HomePageDatas homePageDatas, BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderSections(context,
            cartCount: homePageDatas.cartCount.toString()),
        SizedBox(
          height: 5,
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            buildSlider(homePageDatas.bannersPath),
            SizedBox(
              height: 10,
            ),
            buildCategoryList(homePageDatas.categories),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 7),
              child: Align(
                alignment: Alignment.centerLeft,
                child: createNormalText('Products'),
              ),
            ),
            buildProducts(
                homePageDatas.items, MediaQuery.of(context).size.width)
          ],
        ))
      ],
    );
  }

//LOADING
  Widget _buildLoading(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderSections(context),
        Expanded(child: showHomeLoadingShimmer()),
      ],
    );
  }

//HEADER
  Widget _buildHeaderSections(BuildContext context, {String cartCount}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.menu,
                size: AppTheme.iconSizeS,
                color: AppTheme.primaryBlueColor,
              ),
              onPressed: toggleMenu),
          Expanded(
            child: Container(
                //child: createNormalText('Home', size: AppTheme.fontSizeXL),
                ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: AppTheme.iconSizeS,
              color: AppTheme.primaryBlueColor,
            ),
            onPressed: () async {
              final String searchResult = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchInterface()),
              );
              if (searchResult != null) {
                Navigator.pushNamed(context, Products.myRoute,
                    arguments: ProductHelper(
                        operation: ProductHelper.SEARCH, query: searchResult));
              }
            },
          ),
          buildCartIcon(cartCount: cartCount),
        ],
      ),
    );
  }
}
