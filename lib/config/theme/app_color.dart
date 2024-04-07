import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xff253BFC);
  // static const Color primaryColor = Color(0xff309aBB);
  static const Color secondaryColor = Color(0xff00B2FF);
  static const Color grayColor = Color(0xff8E90AD);
  static const Color yellowColor = Color(0xffF7931A);
  static const Color redColor = Color(0xffF25252);
  static const Color secondRedColor = Color(0xffEE9F91);
  static const Color greenColor = Color(0xff33D49D);

  // Ligth Mode
  static const Color bgLight = Color(0xffF0F0FF);
  static const Color cardLight = Color(0xffFFFFFF);
  static const Color textStrongLight = Color(0xff2A2A42);
  static const Color textSoftLight = Color(0xff596780);

// Dark Mode
  static const Color bgDark = Color(0xff0E1320);
  static const Color cardDark = Color(0xff1E2436);
  static const Color textStrongDark = Color(0xffFFFFFF);
  static const Color textSoftDark = Color(0xff90A3BF);

  static const LinearGradient primaryGradient = LinearGradient(
      colors: [AppColor.primaryColor, AppColor.secondaryColor],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft);
  static const LinearGradient errorGradient = LinearGradient(
      colors: [AppColor.redColor, AppColor.secondRedColor],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft);

  static const LinearGradient primaryButtonGradient = LinearGradient(
      colors: [AppColor.primaryColor, AppColor.secondaryColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static LinearGradient disableButtonGradient = LinearGradient(colors: [
    AppColor.primaryColor.withOpacity(0.5),
    AppColor.secondaryColor.withOpacity(0.5)
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient splashDarkGradient = LinearGradient(
      colors: [AppColor.bgDark, AppColor.cardDark],
      begin: Alignment.centerLeft,
      end: Alignment.topRight);
}
