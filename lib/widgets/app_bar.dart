import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
  BuildContext context, {
  required Widget title,
  PreferredSizeWidget? bottom,
  Color? backgroundColor,
  IconThemeData? iconTheme,
  bool? centerTitle,
  Widget? leading,
  List<Widget>? actions,
  bool noLeading = false,
}) {
  return AppBar(
    elevation: 0,
    bottom: bottom,
    backgroundColor: backgroundColor,
    iconTheme: iconTheme,
    leading: noLeading
        ? null
        : leading ??
            IconButton(
              icon: Image.asset(
                'assets/images/back arrow-8.png',
                height: 22,
                width: 22,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 12,
            ),
    actions: actions,
    title: title,
    centerTitle: centerTitle,
  );
}
