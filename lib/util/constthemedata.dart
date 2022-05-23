import 'package:environment/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var themeData = ThemeData(
  fontFamily: 'frutiger-lt',
  
  unselectedWidgetColor: ConstColors.textTertiaryColor,
  
  primaryColor: ConstColors.primaryColor,
  
  secondaryHeaderColor: ConstColors.secondaryColor,
  
  
  
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: const TextStyle(color: ConstColors.whiteColor))),
  
  
  
  textTheme: const TextTheme(
    headline4: TextStyle(
        color: ConstColors.textPrimaryColor,
        fontSize: 36,
        height: 1.6,
        fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: ConstColors.textPrimaryColor,
        fontSize: 30,
        height: 1.6,
        fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: ConstColors.textPrimaryColor, fontSize: 24, height: 1.5),
    bodyText1: TextStyle(
        color: ConstColors.textPrimaryColor,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        height: 1.6),
    bodyText2: TextStyle(
        color: ConstColors.textPrimaryColor, fontSize: 17, height: 1.5),
    caption: TextStyle(
      color: ConstColors.textPrimaryColor,
      fontSize: 15,
      height: 1.6,
    ),
    overline: TextStyle(
        color: ConstColors.textPrimaryColor,
        fontSize: 13,
        letterSpacing: 0,
        wordSpacing: 0,
        height: 1.6),
    subtitle1: TextStyle(
        color: ConstColors.textPrimaryColor, fontSize: 21, height: 1.6),
    subtitle2: TextStyle(
        color: ConstColors.textPrimaryColor, fontSize: 16, height: 1.6),

    // subtitle1: TextStyle(color: ConstColors.textPrimaryColor, fontSize: 10,fontWeight: FontWeight.normal),
    // subtitle2: TextStyle(color: ConstColors.primaryColor, fontSize: 10,fontWeight: FontWeight.normal),
    button: TextStyle(
        color: ConstColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w700),
  ),
 
 
  appBarTheme: const AppBarTheme(
    backgroundColor: ConstColors.secondaryColor,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black26)),
);
