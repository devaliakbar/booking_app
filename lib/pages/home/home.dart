import 'package:bookingapp/pages/home/bloc/data/home_model.dart';
import 'package:bookingapp/pages/home/bloc/home_bloc.dart';
import 'package:bookingapp/pages/home/widgets/build_category.dart';
import 'package:bookingapp/pages/home/widgets/build_products.dart';
import 'package:bookingapp/pages/home/widgets/home_loading_shimmer.dart';
import 'package:bookingapp/pages/home/widgets/slider.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/statusbar_color.dart';
import 'package:bookingapp/wiidgets/cart_icon.dart';
import 'package:bookingapp/wiidgets/normal_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  static const String myRoute = '/home';
  @override
  Widget build(BuildContext context) {
    setUpStatusbarColor();

    BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer(
        bloc: BlocProvider.of<HomeBloc>(context),
        listener: (context, state) {
          print("Home State Changed");
        },
        builder: (context, state) {
          if (state is HomeLoadingFailedState) {
            return _buildError(state.errorMsg);
          } else if (state is HomeLoadedState) {
            return _buildBody(state.homePageDatas);
          } else {
            return _buildLoading();
          }
        },
      ),
    );
  }

//ERROR WIDGET
  Widget _buildError(String text) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

//MAIN BODY
  Widget _buildBody(HomePageDatas homePageDatas) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _buildHeaderSections(cartCount: homePageDatas.cartCount.toString()),
          SizedBox(
            height: 5,
          ),
          buildSlider(homePageDatas.bannersPath),
          SizedBox(
            height: 10,
          ),
          buildCategoryList(homePageDatas.categories),
          SizedBox(
            height: 5,
          ),
          Expanded(child: buildProducts(homePageDatas.items))
        ],
      ),
    );
  }

//LOADING
  Widget _buildLoading() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _buildHeaderSections(),
          Expanded(child: showHomeLoadingShimmer()),
        ],
      ),
    );
  }

//HEADER
  Widget _buildHeaderSections({String cartCount}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: AppTheme.iconSizeM,
                  ),
                  onPressed: () {}),
              Expanded(
                child: Center(
                  child: createNormalText('Home',
                      size: AppTheme.fontSizeXL, boldText: true),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.search,
                    size: AppTheme.iconSizeM,
                  ),
                  onPressed: () {}),
              buiildCartIcon(cartCount: cartCount),
            ],
          ),
        ),
      ],
    );
  }
}
