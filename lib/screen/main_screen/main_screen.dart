import 'package:flutter/material.dart';
import 'package:shuttle_9ja/screen/main_screen/Home/home_navigation.dart';
import 'package:shuttle_9ja/screen/main_screen/profile/profile_navigator.dart';
import 'package:shuttle_9ja/screen/main_screen/profile/profile_screen.dart';
import 'package:shuttle_9ja/settings/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static String id = '/main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[currentIndex].currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentIndex != 0) {
            // select 'main' tab
            setState(() {
              currentIndex = 0;
            });
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Offstage(
              offstage: currentIndex != 0,
              child: HomeNavigation(
                navigatorKey: navigatorKeys[0],
              ),
            ),
            Offstage(
              offstage: currentIndex != 1,
            ),
            Offstage(
              offstage: currentIndex != 2,
            ),
            Offstage(offstage: currentIndex != 3, child: ProfileScreen()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (currentIndex == value && currentIndex != 3) {
              navigatorKeys[currentIndex]
                  .currentState!
                  .popUntil((route) => route.isFirst);
            } else {
              setState(() {
                currentIndex = value;
              });
            }
          },
          currentIndex: currentIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Constants.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: "....",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: "....",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
