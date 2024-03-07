import 'package:flutter/material.dart';
import 'package:shuttle_9ja/settings/constants.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: Constants.primaryColor,
      // secondary: Constants.white,
      secondary: Constants.baseColor,
      seedColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: Constants.black,
      ),
    )
    // useMaterial3: true,
    );

ThemeData darkTheme = ThemeData.dark();
