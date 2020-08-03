import 'package:bookingapp/pages/product_detail/widgets/product_image/package/carousel_widget.dart';
import 'package:bookingapp/pages/product_detail/widgets/product_image/package/src/carousel/controller/carousel_controller.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<Fragment> listViews;
  Carousel({
    @required this.listViews,
  });
  @override
  Widget build(BuildContext context) {
    return CarouselController(
      listViews: listViews,
    );
  }
}
