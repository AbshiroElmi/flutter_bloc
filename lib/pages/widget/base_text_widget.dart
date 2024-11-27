import 'package:flutter/material.dart';
import 'package:ulearning/common/value/colors.dart';

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    ),
  );
}