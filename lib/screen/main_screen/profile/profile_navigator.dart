import 'package:flutter/material.dart';
import 'package:shuttle_9ja/routres.dart';
import 'package:shuttle_9ja/screen/main_screen/profile/profile_screen.dart';

class ProfileNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const ProfileNavigator({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: ProfileScreen.id,
      onGenerateRoute: (settings) {
        // print(settings);
        return MaterialPageRoute(
          builder: (context) => routes[settings.name]!(context),
        );
      },
    );
  }
}
