import 'package:flutter/material.dart';

class NumpadButton extends StatelessWidget {
  final String num;
  final void Function()? onPressed;
  const NumpadButton({
    Key? key,
    required this.num,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: onPressed,
      child: Text(
        num,
        style: TextStyle(
          color: color.primary,
          fontWeight: FontWeight.w600,
          fontSize: 56,
        ),
      ),
    );
  }
}

class NumpadRemoveButton extends StatelessWidget {
  final void Function()? onPressed;
  const NumpadRemoveButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Icon(
        Icons.backspace,
        size: 32,
      ),
    );
  }
}

class RoundedBorderTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const RoundedBorderTextButton({
    Key? key,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
