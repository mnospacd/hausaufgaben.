import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFF5F5F5); //primarily scaffold background
  static const Color white = Color(0xFFFFFFFF); //on Scaffold
  static const Color greyLightGreen = Color(0xFF85BB8F);
  static const Color greyGreen = Color(0xFF4D6B53); //primary
  static const Color greyDarkGreen = Color(0xFF24402A); //primary dark

  static const TextTheme textTheme = TextTheme(
    bodyText1: body1,
    subtitle1: subtitle1,
    headline6: title2,
    headline5: title1,
    headline4: headline4,
    caption: caption
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16
  );

  static const TextStyle headline4 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w800,
    fontSize: 36
  );

  static const TextStyle title1 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 20
  );

  static const TextStyle title2 = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 18
  );

  static const TextStyle subtitle1 = TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      color: Colors.black
  );

  static const TextStyle caption = TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      color: Colors.grey
  );
}