import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_font.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        primary: isDarkTheme ? AppColor.primaryColor : AppColor.primaryColor,
        onPrimary: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        secondary: AppColor.secondaryColor,
        onSecondary: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        error: AppColor.redColor,
        onError: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        surface: isDarkTheme ? AppColor.bgDark : AppColor.bgLight,
        onSurface: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        onSurfaceVariant:
            isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        surfaceContainerHighest:
            isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        surfaceTint: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        onInverseSurface:
            isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        inverseSurface: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: isDarkTheme ? AppColor.bgDark : AppColor.bgLight,
      primarySwatch: Colors.teal,
      primaryColor: isDarkTheme ? AppColor.primaryColor : AppColor.primaryColor,
      indicatorColor: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
      hintColor: isDarkTheme ? AppColor.darkText2 : AppColor.darkText2,
      highlightColor: isDarkTheme ? AppColor.darkText3 : AppColor.lightText2,
      hoverColor: isDarkTheme ? Colors.black12 : Colors.white12,
      focusColor: isDarkTheme ? AppColor.primaryColor : AppColor.primaryColor,
      disabledColor: isDarkTheme ? AppColor.grayColor : AppColor.grayColor,
      fontFamily: "IbmPlexSans",
      datePickerTheme: DatePickerThemeData(
        shadowColor: AppColor.strokeDark,
        backgroundColor: isDarkTheme ? AppColor.bgDark : AppColor.bgLight,
        surfaceTintColor:
            isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        headerBackgroundColor:
            isDarkTheme ? AppColor.cardDark : AppColor.cardLight,
        headerHeadlineStyle: AppFont.medium12.copyWith(
            color: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1),
        headerHelpStyle: AppFont.medium12.copyWith(
            color: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1),
        headerForegroundColor:
            isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        yearStyle: AppFont.medium12.copyWith(
            color: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1),
        dayStyle: AppFont.medium12.copyWith(
            color: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1),
        weekdayStyle: AppFont.medium12.copyWith(
            color: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1),
        dividerColor: isDarkTheme ? AppColor.darkText1 : AppColor.lightText1,
        dayForegroundColor: WidgetStateColor.resolveWith((states) {
          return isDarkTheme ? AppColor.darkText1 : AppColor.lightText1;
        }),
        dayOverlayColor: WidgetStateColor.resolveWith((states) {
          return isDarkTheme ? AppColor.darkText1 : AppColor.lightText1;
        }),
        yearForegroundColor: WidgetStateColor.resolveWith((states) {
          return isDarkTheme ? AppColor.darkText1 : AppColor.lightText1;
        }),
      ),
      splashColor:
          isDarkTheme ? const Color(0xFF1F1F1F) : const Color(0xffEEF0F4),
      cardColor: isDarkTheme ? AppColor.cardDark : AppColor.cardLight,
      canvasColor: isDarkTheme ? AppColor.strokeDark : AppColor.lightText3,
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
