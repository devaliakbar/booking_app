import 'package:flutter/material.dart';

class BarPointSelected extends StatelessWidget {
  final int currentIndex;
  final List<Widget> listViews;
  BarPointSelected({
    @required this.currentIndex,
    @required this.listViews,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      child: Container(
        color: Colors.white,
        height: 30,
        width: MediaQuery.of(context).size.width - 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: listViews.map<Widget>((index) => index).toList(),
        ),
      ),
    );
  }
}
