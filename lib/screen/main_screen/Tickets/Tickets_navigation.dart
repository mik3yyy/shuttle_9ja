import 'package:flutter/material.dart';
import 'package:shuttle_9ja/routres.dart';
import 'package:shuttle_9ja/screen/main_screen/Home/home_screen.dart';
import 'package:shuttle_9ja/screen/main_screen/Tickets/Tickets.dart';

class TicketNavigation extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const TicketNavigation({super.key, required this.navigatorKey});
  @override
  State<TicketNavigation> createState() => _TicketNavigationState();
}

class _TicketNavigationState extends State<TicketNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      initialRoute: TicketsScreen.id,
      onGenerateRoute: (settings) {
        // print(settings);
        return MaterialPageRoute(
          builder: (context) => Ticketsroutes[settings.name]!(context),
        );
      },
    );
  }
}
