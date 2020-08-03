import 'package:bookingapp/pages/product_detail/widgets/product_image/package/carousel_widget.dart';
import 'package:bookingapp/pages/product_detail/widgets/product_image/package/src/carousel/components/bar_point_selected.dart';
import 'package:bookingapp/pages/product_detail/widgets/product_image/package/src/carousel/components/point_selected.dart';

import 'package:flutter/material.dart';

class CarouselController extends StatefulWidget {
  final List<Fragment> listViews;
  CarouselController({
    @required this.listViews,
  });
  @override
  State<StatefulWidget> createState() {
    return _CarouselController();
  }
}

class _CarouselController extends State<CarouselController> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: PageView(
              onPageChanged: (index) => setState(() => _currentIndex = index),
              physics: BouncingScrollPhysics(),
              children: widget.listViews,
            ),
          ),
          BarPointSelected(
              currentIndex: _currentIndex,
              listViews: widget.listViews
                  .map<Widget>((pointer) => PointSelected(
                        currentIndex: _currentIndex,
                        position: widget.listViews.indexOf(pointer),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
