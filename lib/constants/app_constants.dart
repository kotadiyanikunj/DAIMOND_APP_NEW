import 'package:flutter/material.dart';

String appFontFamily = "SF Pro";
Widget appText(
    {required String text,
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextDecoration? textDecoration,
    TextOverflow? overflow}) {
  return Text(text,
      style: TextStyle(
          fontFamily: 'Sf Pro',
          color: fontColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          overflow: overflow));
}

Widget verticalSpace({required double height}) {
  return SizedBox(height: height);
}

Widget horizontalSpace({required double width}) {
  return SizedBox(width: width);
}
