import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Text appText({
  required String text,
  required double fontSize,
  double? linHeight,
  double? letterSpacing,
  Color? color,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextAlign? textAlign,
  TextDecoration? decoration,
  TextOverflow? overflow,
}) {
  return Text(text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpacing ?? 1,
        color: color ?? Colors.black,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration ?? TextDecoration.none,
        height: linHeight ?? 1.5,
        // fontFamily: 'Montserrat',
      ));
}
