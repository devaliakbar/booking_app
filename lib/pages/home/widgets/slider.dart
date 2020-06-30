import 'package:bookingapp/wiidgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget buildSlider(List bannerPaths) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
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
              margin: EdgeInsets.symmetric(horizontal: 5.0),
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

              // decoration: BoxDecoration(
              //   color: Colors.grey,
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(10),
              //   ),
              // ),
              // child: Center(
              //   child: Text(
              //     'Text $i',
              //     style: TextStyle(fontSize: 16.0),
              //   ),
              // ),
            );
          },
        );
      }).toList(),
    ),
  );
}
