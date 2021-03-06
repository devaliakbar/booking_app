import 'package:bookingapp/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget buildSlider(List bannerPaths) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    child: CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 140.0,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: bannerPaths.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
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
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            );
          },
        );
      }).toList(),
    ),
  );
}
