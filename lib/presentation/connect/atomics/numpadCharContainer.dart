import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:flutter/material.dart';

class NumpadCharContainer extends StatelessWidget {
  final String? ch;
  final bool isError;
  const NumpadCharContainer({
    Key? key,
    required this.isError,
    this.ch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    Widget child;
    if (ch == null) {
      child = Icon(
        Icons.circle,
        color: color.surface,
        size: 64,
      );
    } else {
      child = DescriptionText(
        ch!,
        color: isError ? color.error : color.primary,
        fontSize: 42,
      );
    }
    return SizedBox(
      width: 72,
      height: 72,
      child: Center(child: child),
    );
  }
}
