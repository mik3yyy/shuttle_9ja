import 'package:flutter/material.dart';
import 'package:shuttle_9ja/settings/constants.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    primary: Constants.primaryColor,
    tertiary: Constants.white,
    secondary: Constants.baseColor,
    seedColor: Colors.white,
  ),
  primaryColorDark: Constants.black,
  textTheme: TextTheme(
    titleSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
      color: Constants.black,
    ),
  ),
  cardTheme: CardTheme(
    color: Constants.white,
    // elevation: 10,
  ),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Constants.black,
      fontSize: 20,
    ),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Constants.black,
    ),
  ),
  // dialogTheme: DialogTheme(
  //   // elevation: 20,
  //   // contentTextStyle: TextStyle(),
  //   shape: BeveledRectangleBorder(),
  // ),
);

ThemeData darkTheme = ThemeData.dark();
