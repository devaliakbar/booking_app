import 'package:bookingapp/pages/product_detail/widgets/product_image/package/carousel_widget.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final List<String> imageUrls;
  ProductImage(this.imageUrls);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 30,
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: (screenWidth) * 0.75,
      child: Carousel(
        listViews: imageUrls.map(
          (i) {
            return Fragment(
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                imageUrl: i,
                placeholder: (context, url) => showLoading(),
                errorWidget: (context, url, error) => Icon(
                  Icons.broken_image,
                  color: AppTheme.secondaryGreenColor,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
