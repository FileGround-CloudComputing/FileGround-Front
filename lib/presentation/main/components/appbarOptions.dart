import 'package:flutter/material.dart';

class AppBarOptions extends StatelessWidget {
  const AppBarOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          child: Text('설정'),
        ),
        const PopupMenuItem(
          child: Text('크레딧'),
        ),
      ],
    );
  }
}
