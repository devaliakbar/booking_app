import 'package:bookingapp/utility/ensure_visible.dart';
import 'package:flutter/material.dart';

import '../utility/app_theme.dart';

Widget buildTextField(
    {label,
    inputType = TextInputType.text,
    maxLine = 1,
    cFocusNode,
    cController,
    maxlength = 50,
    enabled: true,
    Function cOnSave,
    Function cValidator}) {
  return EnsureVisibleWhenFocused(
    focusNode: cFocusNode,
    child: TextFormField(
      enabled: enabled,
      maxLength: maxlength,
      style: new TextStyle(
        color: Colors.black,
      ),
      maxLines: maxLine,
      keyboardType: inputType,
      focusNode: cFocusNode,
      decoration: InputDecoration(
        counterText: "",
        fillColor: AppTheme.greyPrimaryColor,
        filled: true,
        labelStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 13),
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: AppTheme.primaryGreenColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: AppTheme.greyPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: AppTheme.greyPrimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
      ),
      controller: cController,
      onSaved: (String value) {
        if (cOnSave != null) {
          cOnSave(value);
        }
      },
      validator: (value) {
        if (cValidator != null) {
          return cValidator(value);
        } else {
          return null;
        }
      },
    ),
  );
}
