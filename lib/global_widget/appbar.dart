import 'package:flutter/material.dart';

AppBar DefaultAppBar(BuildContext context) {
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
    leadingWidth: 100,
  );
}
