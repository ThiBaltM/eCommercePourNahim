import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFD4AF37);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  static const TextStyle primaryTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
  );

  static const TextStyle secondaryTextStyle = TextStyle(
    fontFamily: 'Roboto',
  );

  static const TextStyle headingTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: whiteColor,
  );

  static const TextStyle yellowPrimaryTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    color: primaryColor,
  );

  static const TextStyle subHeadingTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
    color: whiteColor,
  );

  static const TextStyle priceTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: whiteColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: whiteColor,
  );

  static const BoxDecoration primaryButtonDecoration = BoxDecoration(
    color: primaryColor,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

}