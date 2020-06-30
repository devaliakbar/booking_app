import 'package:bookingapp/pages/home/bloc/data/home_model.dart';
import 'package:bookingapp/pages/home/bloc/home_bloc.dart';
import 'package:bookingapp/pages/home/widgets/slider.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/wiidgets/cart_icon.dart';
import 'package:bookingapp/wiidgets/loading_widget.dart';
import 'package:bookingapp/wiidgets/normal_text.dart';
import 'package:bookingapp/wiidgets/search_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  static const String myRoute = '/home';
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());

    return Scaffold(
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
            height: 7,
          ),
          buildSlider(homePageDatas.bannersPath)
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
          Expanded(child: showLoading())
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
                    size: AppTheme.iconSizeL,
                  ),
                  onPressed: () {}),
              Expanded(
                child: Center(
                  child: createNormalText('Home',
                      size: AppTheme.fontSizeL, boldText: true),
                ),
              ),
              buiildCartIcon(cartCount: cartCount)
            ],
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: buildSearchField(_searchController, _searchTriggered),
        ),
      ],
    );
  }

  final TextEditingController _searchController = TextEditingController();
  _searchTriggered() {
    print(_searchController.text);
  }
}