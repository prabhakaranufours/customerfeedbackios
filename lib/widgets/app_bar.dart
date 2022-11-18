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
    leading: leading,
    actions: actions,
    title: title,
    centerTitle: centerTitle,
  );
}
