import 'package:flutter/material.dart';

class RoundedSurfaceContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  const RoundedSurfaceContainer({
    Key? key,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(32),
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
