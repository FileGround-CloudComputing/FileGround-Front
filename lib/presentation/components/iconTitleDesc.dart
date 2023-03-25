import 'package:file_ground_front/presentation/atomic/icons.dart';
import 'package:file_ground_front/presentation/atomic/texts.dart';
import 'package:flutter/material.dart';

class IconTitleDesc extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const IconTitleDesc({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              title,
              color: color.onSurface,
            ),
            DescriptionText(
              description,
              color: color.onSurfaceVariant,
            ),
          ],
        ),
      ],
    );
  }
}
