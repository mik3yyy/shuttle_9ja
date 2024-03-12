import 'package:flutter/material.dart';
import 'package:shuttle_9ja/settings/constants.dart';

AppBar DefaultAppBar(BuildContext context,
    {String title = '', List<Widget> actions = const []}) {
  return AppBar(
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: [
          Icon(Icons.chevron_left),
          Text(
            "Back",
            style: TextStyle(color: Theme.of(context).primaryColorDark),
          ),
        ],
      ),
    ),
    title: Text(title),
    leadingWidth: 100,
    actions: actions,
  );
}
