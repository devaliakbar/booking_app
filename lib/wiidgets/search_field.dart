import 'package:flutter/material.dart';

Widget buildSearchField(
    TextEditingController controller, Function onTextChange) {
  return Container(
    height: 50,
    child: TextField(
      controller: controller,
      onChanged: (value) => onTextChange(),
      decoration: new InputDecoration(
          contentPadding: EdgeInsets.only(top: 7, left: 10),
          suffixIcon: Icon(Icons.search),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(25.0),
            ),
          ),
          hintText: 'Search'),
    ),
  );
}
