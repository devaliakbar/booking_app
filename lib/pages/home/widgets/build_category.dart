import 'package:bookingapp/pages/home/bloc/data/home_model.dart';
import 'package:bookingapp/pages/products/product_helper.dart';
import 'package:bookingapp/pages/products/products.dart';
import 'package:bookingapp/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildCategoryList(List categories) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    height: 73,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildCategoryItem(context, index, categories),
    ),
  );
}

Widget _buildCategoryItem(BuildContext context, int index, List categories) {
  Categories category = categories[index];
  return InkWell(
    onTap: () {
      Navigator.pushNamed(
        context,
        Products.myRoute,
        arguments: ProductHelper(
            operation: ProductHelper.CATEGORY,
            query: category.name,
            idOfCategory: category.id),
      );
    },
    child: Container(
      margin: EdgeInsets.only(right: 13),
      width: 68,
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        imageUrl: category.imagePath,
        placeholder: (context, url) => showLoading(),
        errorWidget: (context, url, error) => Icon(
          Icons.person,
          color: Colors.black,
        ),
      ),
    ),
  );
}
