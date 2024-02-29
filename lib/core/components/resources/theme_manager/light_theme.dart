import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color_manager.dart';
import '../font_manager.dart';
import '../size_manager.dart';
import 'input_decoration_theme.dart';

ThemeData lightTheme() {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: ColorManager.white,
      appBarTheme: const AppBarTheme(
        foregroundColor: ColorManager.lightBlack,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: ColorManager.ministryColor,
          fontSize: 30,
          fontWeight: FontWeightManager.bold,
        ),
      ),
      tabBarTheme: const TabBarTheme(
          dividerColor: ColorManager.writingColor,
          indicatorColor: ColorManager.writingColor,

          labelStyle:  TextStyle(
            color: ColorManager.black,
            fontWeight: FontWeightManager.bold,
            fontFamily: FontConstants.mainFontFamily,
            fontSize: 14,
          ),
          labelColor: ColorManager.writingColor,
          unselectedLabelColor: ColorManager.black

      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorManager.white,
          iconSize: SizeManager.bigRadius,
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(SizeManager.mediumRadius)))),
      inputDecorationTheme: MyLightInputTheme().theme(),
      colorScheme: ThemeData().colorScheme.copyWith(
        primary: ColorManager.ministryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorManager.mainColor,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(
            color: ColorManager.lightBlack,
            fontSize: 12,
            fontWeight: FontWeightManager.bold,
            fontFamily: FontConstants.mainFontFamily),
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 40,
            color: ColorManager.writingColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.semiBold),
        titleLarge: TextStyle(
            fontSize: 30,
            color: ColorManager.writingColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.semiBold),
        bodyLarge: TextStyle(
            fontSize: 20,
            color: ColorManager.writingColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.semiBold),
        bodyMedium: TextStyle(
            fontSize: 16,
            color: ColorManager.writingColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.regular),
        bodySmall: TextStyle(
            fontSize: 14,
            color: ColorManager.grey,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.regular),
        displaySmall: TextStyle(
            fontSize: 15,
            color: ColorManager.grey,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.regular),
        headlineMedium: TextStyle(
            fontSize: 15,
            color: ColorManager.writingColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.medium),
        displayMedium: TextStyle(
            fontSize: 14,
            color: ColorManager.black,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.regular),
        labelSmall: TextStyle(
            fontSize: 12,
            color: ColorManager.cautionColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.semiBold),


      )
  );
}