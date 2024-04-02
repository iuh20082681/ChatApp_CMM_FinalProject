import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextStyle sfRegular(
    {required Color tColor,
    required double tSize,
    TextDecoration? textDecoration}) {
  return TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    color: tColor,
    decoration: textDecoration,
    fontSize: tSize,
  );
}

TextStyle sfLight(
    {required Color tColor,
    required double tSize,
    TextDecoration? textDecoration}) {
  return TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w300,
    color: tColor,
    decoration: textDecoration,
    fontSize: tSize,
  );
}

TextStyle sfMedium(
    {required Color tColor,
    required double tSize,
    TextDecoration? textDecoration}) {
  return TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    color: tColor,
    decoration: textDecoration,
    fontSize: tSize,
  );
}

TextStyle sfSemibold(
    {required Color tColor,
    required double tSize,
    TextDecoration? textDecoration}) {
  return TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
    color: tColor,
    fontSize: tSize,
    decoration: textDecoration,
  );
}

TextStyle sfBold(
    {required Color tColor,
    required double tSize,
    TextDecoration? textDecoration}) {
  return TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    color: tColor,
    decoration: textDecoration,
    fontSize: tSize,
  );
}

TextStyle sfBlack(
    {required Color tColor,
    required double tSize,
    TextDecoration? textDecoration}) {
  return TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w800,
    decoration: textDecoration,
    color: tColor,
    fontSize: tSize,
  );
}
