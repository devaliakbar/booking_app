import 'package:bookingapp/pages/products/bloc/data/products_model.dart';
import 'package:bookingapp/pages/products/bloc/products_bloc.dart';
import 'package:bookingapp/pages/products/product_helper.dart';
import 'package:bookingapp/pages/products/widgets/products_loading_shimmer.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/build_products.dart';
import 'package:bookingapp/widgets/cart_icon.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:bookingapp/widgets/search_interface/search_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatefulWidget {
  static const String myRoute = '/products';

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ProductHelper passedDetails;

  @override
  Widget build(BuildContext context) {
    if (passedDetails == null) {
      passedDetails = ModalRoute.of(context).settings.arguments;
    }

    BlocProvider.of<ProductsBloc>(context).add(ProductLoadEvent(passedDetails));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer(
          bloc: BlocProvider.of<ProductsBloc>(context),
          listener: (context, state) {
            print("Home State Changed");
          },
          builder: (context, state) {
            if (state is ProductsLoadingFailedState) {
              return _buildError(state.errorMsg);
            } else if (state is ProductsLoadedState) {
              return _buildBody(state.productsDatas);
            } else {
              return _buildLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildError(String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeaderSections(),
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

  Widget _buildBody(ProductsDatas productsDatas) {
    return Column(
      children: <Widget>[
        _buildHeaderSections(cartCount: productsDatas.cartCount.toString()),
        SizedBox(
          height: 5,
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            buildProducts(
                productsDatas.items, MediaQuery.of(context).size.width)
          ],
        ))
      ],
    );
  }

  Widget _buildLoading() {
    return Column(
      children: <Widget>[
        _buildHeaderSections(),
        SizedBox(
          height: 5,
        ),
        Expanded(child: showProductsLoadingShimmer()),
      ],
    );
  }

  Widget _buildHeaderSections({String cartCount}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: AppTheme.iconSizeS,
                color: AppTheme.primaryBlueColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          Expanded(
            child: Container(
              child: createNormalText(passedDetails.query,
                  truncate: true, size: AppTheme.fontSizeL),
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
                  passedDetails = new ProductHelper(
                      operation: ProductHelper.SEARCH, query: searchResult);
                  if (mounted) {
                    setState(() {});
                  }
                }
              }),
          buildCartIcon(cartCount: cartCount),
        ],
      ),
    );
  }
}
