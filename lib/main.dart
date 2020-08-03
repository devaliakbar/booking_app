import 'package:bookingapp/pages/cart/cart.dart';
import 'package:bookingapp/pages/category/bloc/category_bloc.dart';
import 'package:bookingapp/pages/category/bloc/data/category_repo.dart';
import 'package:bookingapp/pages/category/category.dart';
import 'package:bookingapp/pages/home/bloc/data/home_repo.dart';
import 'package:bookingapp/pages/home/bloc/home_bloc.dart';
import 'package:bookingapp/pages/home/main_home.dart';
import 'package:bookingapp/pages/product_detail/bloc/data/product_detail_repo.dart';
import 'package:bookingapp/pages/product_detail/bloc/product_detail_bloc.dart';
import 'package:bookingapp/pages/product_detail/product_detail.dart';
import 'package:bookingapp/pages/products/bloc/data/products_repo.dart';
import 'package:bookingapp/pages/products/bloc/products_bloc.dart';
import 'package:bookingapp/pages/products/products.dart';
import 'package:bookingapp/pages/splash_screen/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return HomeBloc(HomeRepo());
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return ProductsBloc(ProductsRepo());
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return CategoryBloc(CategoryRepo());
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return ProductDetailBloc(ProductDetailRepo());
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        routes: {
          SplashScreen.myRoute: (BuildContext context) => SplashScreen(),
          MainHome.myRoute: (BuildContext context) => MainHome(),
          Products.myRoute: (BuildContext context) => Products(),
          Category.myRoute: (BuildContext context) => Category(),
          ProductDetail.myRoute: (BuildContext context) => ProductDetail(),
          Cart.myRoute: (BuildContext context) => Cart(),
        },
      ),
    );
  }
}
