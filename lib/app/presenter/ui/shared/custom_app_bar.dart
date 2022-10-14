import 'package:flutter/material.dart';

import 'styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
    this.page, {
    Key? key,
  }) : super(key: key);

  final String page;
  @override
  Size get preferredSize => const Size(double.maxFinite, 45);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: colorBlackText),
      elevation: .7,
      backgroundColor: Colors.white,
      title: Text(key: const Key("pageTitle"), page, style: appBarTextStyle),
    );
  }
}
