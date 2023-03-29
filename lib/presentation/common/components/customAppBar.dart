import 'package:flutter/material.dart';

import '../atomic/texts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final double height;
  final Widget title;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.height = 100,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return AppBar(
      toolbarHeight: height,
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
