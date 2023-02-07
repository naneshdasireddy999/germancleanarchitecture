import 'package:dfg/3_application/core/manager/color_manager.dart';
import 'package:dfg/3_application/core/manager/fonts_manager.dart';
import 'package:dfg/3_application/core/manager/styles_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // Text Style - light
  // *****************

  static const TextStyle _lightHeadingText = TextStyle(
      //here iam using color manager
      color: ColorManager.lightTextColorPrimary,
      //here iam using fontconstants in font manager
      fontFamily: FontConstants.fontfamily,
      //here iam using fontsize in fontmanager
      fontSize: FontSize.s20,
      //here iam using fontweightmanager in font manager
      fontWeight: FontWeightManager.bold);

  static const TextStyle _lightBodyText = TextStyle(
      //here iam using color manager
      color: ColorManager.lightTextColorPrimary,
      //here iam using fontconstants in font manager
      fontFamily: FontConstants.fontfamily,
      //here iam using fontstyle from fontmanager
      fontStyle: FontStyles.italic,
      //here iam using fontweightmanager in font manager
      fontWeight: FontWeightManager.bold,
      //here iam using fontsize in fontmanager
      fontSize: FontSize.s16);

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      //here iam using color manager
      _lightHeadingText.copyWith(color: ColorManager.darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      //here iam using color manager
      _lightBodyText.copyWith(color: ColorManager.darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayMedium: _darkThemeHeadingTextStyle,
    bodyMedium: _darkThemeBodyeTextStyle,
  );

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
      //here iam using color manager
//for textformfield use inpudecorationtheme

      scaffoldBackgroundColor:
          ColorManager.lightPrimaryColor, //main colors of an app
      appBarTheme: const AppBarTheme(
          //here iam using color manager
          color: ColorManager.appbarColorLight, //main colors of an app
          //here iam using color manager
          iconTheme: IconThemeData(
              color: ColorManager.iconColor)), //main colors of an app
      //here iam using color manager
      bottomAppBarColor: ColorManager.appbarColorLight, //main colors of an app
      colorScheme: ColorScheme.light(
        //here iam using color manager
        primary: ColorManager.lightPrimaryColor, //main colors of an app
        //here iam using color manager
        onPrimary: ColorManager.lightOnPrimaryColor, //main colors of an app
        //here iam using color manager
        secondary: ColorManager.accentColor, //main colors of an app
        //here iam using color manager
        primaryContainer:
            ColorManager.lightPrimaryVariantColor, //main colors of an app
      ),
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      //here iam using color manager
      scaffoldBackgroundColor: ColorManager.darkOnPrimaryColor,
      appBarTheme: AppBarTheme(
          //here iam using color manager
          color: ColorManager.appbarColorDark, //main colors of an app
          //here iam using color manager
          iconTheme: const IconThemeData(
              color: ColorManager.iconColor)), //main colors of an app
      //here iam using color manager
      bottomAppBarColor: ColorManager.appbarColorDark, //main colors of an app
      colorScheme: ColorScheme.dark(
        //here iam using color manager
        primary: ColorManager.darkPrimaryColor, //main colors of an app
        //here iam using color manager
        secondary: ColorManager.accentColor, //main colors of an app
        //here iam using color manager
        onPrimary: ColorManager.darkOnPrimaryColor, //main colors of an app
        //here iam using color manager
        primaryContainer:
            ColorManager.darkPrimaryVariantColor, //main colors of an app
      ),
      textTheme: _darkTextTheme);
}
