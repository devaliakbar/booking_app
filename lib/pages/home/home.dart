import 'package:bookingapp/pages/home/bloc/data/home_model.dart';
import 'package:bookingapp/pages/home/bloc/home_bloc.dart';
import 'package:bookingapp/pages/home/widgets/build_category.dart';
import 'package:bookingapp/pages/home/widgets/home_loading_shimmer.dart';
import 'package:bookingapp/pages/home/widgets/slider.dart';
import 'package:bookingapp/pages/products/product_helper.dart';
import 'package:bookingapp/pages/products/products.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/build_products.dart';
import 'package:bookingapp/widgets/cart_icon.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:bookingapp/widgets/search_field.dart';
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
        _buildHeaderSections(
          context,
          cartCount: homePageDatas.cartCount.toString(),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: createNormalText('Good Morning!', boldText: true),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 3, bottom: 10),
              child: createNormalText(
                  'Let\'s order some food and have a delicious day',
                  color: AppTheme.secondaryBlackColor,
                  size: AppTheme.fontSizeXS),
            ),
            InkWell(
              onTap: () async {
                final String searchResult = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchInterface()),
                );
                if (searchResult != null) {
                  Navigator.pushNamed(context, Products.myRoute,
                      arguments: ProductHelper(
                          operation: ProductHelper.SEARCH,
                          query: searchResult));
                }
              },
              child: buildSearchField(),
            ),
            SizedBox(
              height: 13,
            ),
            buildSlider(homePageDatas.bannersPath),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  createNormalText('Categories', boldText: true),
                  createNormalText('View All',
                      color: AppTheme.secondaryBlackColor,
                      size: AppTheme.fontSizeXS)
                ],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            buildCategoryList(homePageDatas.categories),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: createNormalText('Our Products', boldText: true),
            ),
            SizedBox(
              height: 13,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Icons.sort,
                size: AppTheme.iconSize,
                color: AppTheme.primaryGreenColor,
              ),
              onPressed: toggleMenu),
        ),
        buildCartIcon(cartCount: cartCount),
      ],
    );
  }
}
