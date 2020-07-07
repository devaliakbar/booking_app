import 'package:bookingapp/pages/home/bloc/data/home_model.dart';
import 'package:bookingapp/pages/products/product_helper.dart';
import 'package:bookingapp/pages/products/products.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildCategoryList(List categories) {
  List cat1 = [];
  List cat2 = [];
  if (categories.length > 8) {
    int split = categories.length;
    if (split % 2 != 0) {
      split = split + 1;
    }
    split = (split / 2).round();

    cat1 = categories.sublist(0, split);
    cat2 = categories.sublist(split, categories.length);
  } else {
    cat1 = categories;
  }

  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: createNormalText(
            'Shop by Category',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 95,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cat1.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildCategoryItem(context, index, cat1),
          ),
        ),
        cat2.length == 0
            ? Container()
            : SizedBox(
                height: 10,
              ),
        cat2.length == 0
            ? Container()
            : Container(
                height: 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cat2.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildCategoryItem(context, index, cat2),
                ),
              ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            createNormalText('View all',
                color: AppTheme.lightBlackColor, size: AppTheme.fontSizeS),
            SizedBox(
              width: 7,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.lightBlackColor,
              size: AppTheme.iconSizeXS,
            )
          ],
        ),
      ],
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
      width: 90,
      margin: EdgeInsets.symmetric(horizontal: 1),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                imageUrl: category.imagePath,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            createNormalText(category.name,
                truncate: true, size: AppTheme.fontSizeS)
          ],
        ),
      ),
    ),
  );
}
