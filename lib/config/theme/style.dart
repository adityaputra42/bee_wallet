import 'package:flutter/material.dart';

import 'app_color.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        primary: isDarkTheme ? AppColor.primaryColor : AppColor.primaryColor,
        onPrimary:
            isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
        secondary: AppColor.secondaryColor,
        onSecondary:
            isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
        error: AppColor.redColor,
        onError:
            isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
        surface: isDarkTheme ? AppColor.bgDark : AppColor.bgLight,
        onSurface:
            isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
        onSurfaceVariant:
            isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
        surfaceTint:
            isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
        onInverseSurface:
            isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
        inverseSurface:
            isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
      ),
      useMaterial3: false,
      scaffoldBackgroundColor: isDarkTheme ? AppColor.bgDark : AppColor.bgLight,
      primarySwatch: Colors.teal,
      primaryColor: isDarkTheme ? AppColor.primaryColor : AppColor.primaryColor,
      indicatorColor:
          isDarkTheme ? AppColor.textStrongDark : AppColor.textStrongLight,
      hintColor: isDarkTheme ? AppColor.textSoftDark : AppColor.textSoftLight,
      highlightColor:
          isDarkTheme ? const Color(0xff334155) : AppColor.primaryColor,
      hoverColor: isDarkTheme ? Colors.black12 : Colors.white12,
      focusColor: isDarkTheme ? AppColor.primaryColor : AppColor.primaryColor,
      disabledColor: isDarkTheme ? AppColor.grayColor : AppColor.grayColor,
      fontFamily: "Poppins",
      splashColor:
          isDarkTheme ? const Color(0xFF1F1F1F) : const Color(0xffEEF0F4),
      cardColor: isDarkTheme ? AppColor.cardDark : AppColor.cardLight,
      canvasColor: isDarkTheme ? AppColor.grayColor : AppColor.grayColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: AppBarTheme(
          elevation: 0.5,
          backgroundColor: isDarkTheme ? AppColor.bgDark : AppColor.bgLight),
    );
  }
}
