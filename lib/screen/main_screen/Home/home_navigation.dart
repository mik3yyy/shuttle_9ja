import 'package:flutter/material.dart';
import 'package:shuttle_9ja/routres.dart';
import 'package:shuttle_9ja/screen/main_screen/Home/home_screen.dart';

class HomeNavigation extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const HomeNavigation({super.key, required this.navigatorKey});
  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      initialRoute: HomeScreen.id,
      onGenerateRoute: (settings) {
        // print(settings);
        return MaterialPageRoute(
          builder: (context) => routes[settings.name]!(context),
        );
      },
    );
  }
}
