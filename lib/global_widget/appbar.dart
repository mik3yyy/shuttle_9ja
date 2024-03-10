import 'package:flutter/material.dart';

AppBar DefaultAppBar(BuildContext context,
    {String title = '', List<Widget> actions = const []}) {
  return AppBar(
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: [
          Icon(Icons.chevron_left),
          Text("Back"),
        ],
      ),
    ),
    title: Text(title),
    leadingWidth: 100,
    actions: actions,
  );
}
