import 'package:bookingapp/pages/category/bloc/category_bloc.dart';
import 'package:bookingapp/pages/category/bloc/data/category_model.dart';
import 'package:bookingapp/pages/category/widgets/category_loading_shimmer.dart';
import 'package:bookingapp/pages/home/widgets/home_loading_shimmer.dart';
import 'package:bookingapp/pages/products/product_helper.dart';
import 'package:bookingapp/pages/products/products.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/cart_icon.dart';
import 'package:bookingapp/widgets/error_info.dart';
import 'package:bookingapp/widgets/loading_widget.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Category extends StatelessWidget {
  static const String myRoute = '/category';
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context).add(CategoryLoadEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer(
          bloc: BlocProvider.of<CategoryBloc>(context),
          listener: (context, state) {
            print("Home State Changed");
          },
          builder: (context, state) {
            if (state is CategoryLoadingFailedState) {
              return _buildError(state.errorMsg, context);
            } else if (state is CategoryLoadedState) {
              return _buildBody(state.categoryPageDatas, context);
            } else {
              return _buildLoading(context);
            }
          },
        ),
      ),
    );
  }

//ERROR WIDGET
  Widget _buildError(String errorMsg, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeaderSections(context),
        Expanded(
          child: buildErrorMsg(errorMsg),
        ),
      ],
    );
  }

//HEADER
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
              "Categories",
              truncate: true,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        buildCartIcon(cartCount: cartCount),
      ],
    );
  }

//LOADING
  Widget _buildLoading(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderSections(context),
        SizedBox(
          height: 15,
        ),
        Expanded(child: showCategoryLoadingShimmer()),
      ],
    );
  }

  //MAIN BODY
  Widget _buildBody(CategoryPageData categoryPageDatas, BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderSections(
          context,
          cartCount: categoryPageDatas.cartCount.toString(),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: categoryPageDatas.categories.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildCategory(context, categoryPageDatas.categories[index]),
          ),
        )
      ],
    );
  }

  List backgroundcolors = [
    AppTheme.categoryColorOrange,
    AppTheme.categoryColorCreme,
    AppTheme.categoryColorPink,
    AppTheme.categoryColorYellow,
    AppTheme.categoryColorGreen
  ];

  int currentColorIndex = -1;

  Widget _buildCategory(BuildContext context, Categories categories) {
    if (currentColorIndex < 4) {
      currentColorIndex++;
    } else {
      currentColorIndex = 0;
    }

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Products.myRoute,
        arguments: ProductHelper(
            operation: ProductHelper.CATEGORY,
            query: categories.name,
            idOfCategory: categories.id),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundcolors[currentColorIndex],
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  createNormalText(categories.name,
                      truncate: true, boldText: true, size: AppTheme.fontSizeS),
                  SizedBox(
                    height: 10,
                  ),
                  createNormalText(categories.description,
                      maxLine: 2,
                      truncate: true,
                      color: AppTheme.secondaryBlackColor,
                      size: AppTheme.fontSizeXS),
                ],
              ),
            ),
            Container(
              height: 68,
              width: 68,
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                imageUrl: categories.imagePath,
                placeholder: (context, url) => showLoading(),
                errorWidget: (context, url, error) => Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
