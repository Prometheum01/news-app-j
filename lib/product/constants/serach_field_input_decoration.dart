import 'package:flutter/material.dart';
import 'package:news_app_for_job/product/constants/string_const.dart';

class SearchFieldInputDecoration extends InputDecoration {
  SearchFieldInputDecoration({required Function onTap})
      : super(
          hintText: StringConst.searchFieldHintText,
          prefixIcon: IconButton(
            onPressed: () {
              onTap();
            },
            splashRadius: 24,
            icon: const Icon(Icons.search),
          ),
          enabledBorder: CustomOutlineBorder(),
          focusedBorder: CustomOutlineBorder(),
          errorBorder: CustomOutlineBorder(color: Colors.red),
          focusedErrorBorder: CustomOutlineBorder(color: Colors.red),
        );
}

class CustomOutlineBorder extends OutlineInputBorder {
  CustomOutlineBorder({Color color = Colors.grey, double radius = 16.0})
      : super(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            borderSide: BorderSide(color: color));
}
