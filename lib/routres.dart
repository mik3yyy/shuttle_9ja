import 'package:flutter/material.dart';
import 'package:shuttle_9ja/screen/main_screen/main_screen.dart';
import 'package:shuttle_9ja/screen/main_screen/profile/profile_screen.dart';
import 'package:shuttle_9ja/screen/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  MainScreen.id: (p0) => MainScreen(),
  SplashScreen.id: (p0) => SplashScreen(),
  ProfileScreen.id: (p0) => ProfileScreen()
};
