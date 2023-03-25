import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({
    super.key,
    required this.icon,
    this.size = 64,
  });
  final double size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.primary,
        borderRadius: BorderRadius.circular(64),
      ),
      child: Icon(
        icon,
        size: size * 0.75,
        color: color.onPrimary,
      ),
    );
  }
}
