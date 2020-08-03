import 'package:bookingapp/pages/home/bloc/home_bloc.dart';
import 'package:bookingapp/pages/home/home.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/statusbar_color.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHome extends StatefulWidget {
  static const String myRoute = '/home';
  @override
  State<StatefulWidget> createState() {
    return _MainHomeState();
  }
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());

    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    setUpStatusbarColor(
        backgroundColor:
            isCollapsed ? Colors.white : AppTheme.primaryGreenColor,
        whiteColor: !isCollapsed);

    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            getDrawer(context, _slideAnimation, _menuScaleAnimation,
                drawerCloseFunction),
            dashboard(context),
          ],
        ),
      ),
    );
  }

  getDrawer(BuildContext context, slideAnimation, menuScaleAnimation,
      Function closeFunction) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuScaleAnimation,
        child: Container(
          margin: EdgeInsets.only(left: 15),
          color: AppTheme.primaryGreenColor,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: createNormalText('MENU',
                      color: Colors.white, size: AppTheme.fontSizeXL),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.library_books,
                      color: AppTheme.secondaryGreenColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    createNormalText(
                      'My Orders',
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      color: AppTheme.secondaryGreenColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    createNormalText(
                      'My Cart',
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: AppTheme.secondaryGreenColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    createNormalText(
                      'Settings',
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: AppTheme.secondaryGreenColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    createNormalText(
                      'Log Out',
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: -30,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: isCollapsed ? 0 : 8,
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(isCollapsed ? 0.0 : 25.0),
                bottomLeft: Radius.circular(isCollapsed ? 0.0 : 25.0),
              ),
            ),
            padding: EdgeInsets.only(
                top: isCollapsed ? 0.0 : 15,
                bottom: isCollapsed ? 0.0 : 15,
                left: isCollapsed ? 0.0 : 15),
            child: Home(drawerToggleFunction),
          ),
        ),
      ),
    );
  }

  drawerCloseFunction() {
    if (mounted) {
      setState(() {
        _controller.reverse().then((e) {
          if (mounted) {
            setState(() {
              backgroundColor = Colors.white;
            });
          }
        });
        isCollapsed = !isCollapsed;
      });
    }
  }

  drawerToggleFunction() {
    if (mounted) {
      setState(() {
        if (isCollapsed) {
          backgroundColor = AppTheme.primaryGreenColor;
          _controller.forward();
        } else
          _controller.reverse().then((e) {
            if (mounted) {
              setState(() {
                backgroundColor = Colors.white;
              });
            }
          });

        isCollapsed = !isCollapsed;
      });
    }
  }
}
