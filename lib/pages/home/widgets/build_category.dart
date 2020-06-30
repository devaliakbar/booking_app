import 'package:bookingapp/pages/home/bloc/data/home_model.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/wiidgets/loading_widget.dart';
import 'package:bookingapp/wiidgets/normal_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildCategoryList(List categories) {
  List cat1 = [];
  List cat2 = [];
  if (categories.length > 3) {
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
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            createNormalText('Categories'),
            createNormalText('See All', color: AppTheme.yellowColor)
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Container(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cat1.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildCategoryItem(index, cat1),
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
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cat2.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildCategoryItem(index, cat2),
                ),
              )
      ],
    ),
  );
}

Widget _buildCategoryItem(int index, List categories) {
  Categories category = categories[index];
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 200,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 5),
          width: 70,
          height: 65,
          child: CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.scaleDown,
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
        Expanded(
          child: Center(
            child: createNormalText(category.name, truncate: true),
          ),
        )
      ],
    ),
  );
}
