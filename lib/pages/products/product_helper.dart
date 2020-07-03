import 'package:flutter/material.dart';

class ProductHelper {
  static const String SEARCH = "SEARCH";
  static const String CATEGORY = "CATEGORY";

  final String operation;
  final String query;
  final String idOfCategory;
  ProductHelper(
      {@required this.operation, @required this.query, this.idOfCategory});
}
