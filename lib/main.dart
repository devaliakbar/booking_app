import 'package:bookingapp/pages/home/bloc/data/home_repo.dart';
import 'package:bookingapp/pages/home/bloc/home_bloc.dart';
import 'package:bookingapp/pages/home/main_home.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        routes: {
          SplashScreen.myRoute: (BuildContext context) => SplashScreen(),
          MainHome.myRoute: (BuildContext context) => MainHome(),
        },
      ),
    );
  }
}
