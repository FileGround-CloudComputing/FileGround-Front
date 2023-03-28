import 'package:flutter/material.dart';

import '../atomic/icons.dart';
import '../atomic/texts.dart';

class IconTitleDesc extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  const IconTitleDesc({
    Key? key,
    required this.icon,
    required this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Row(
      children: [
        RoundedIcon(icon: icon),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldText(
              title,
              color: color.onSurface,
            ),
            if (description != null)
              DescriptionText(
                description!,
                color: color.onSurfaceVariant,
              ),
          ],
        ),
      ],
    );
  }
}
