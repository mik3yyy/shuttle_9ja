import 'package:flutter/material.dart';
import 'package:shuttle_9ja/settings/constants.dart';

AppBar DefaultAppBar(BuildContext context,
    {String title = '', List<Widget> actions = const [], bool pop = true}) {
  return AppBar(
    leading: pop
        ? GestureDetector(
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
          )
        : Container(),
    title: Text(title),
    leadingWidth: 100,
    actions: actions,
  );
}
