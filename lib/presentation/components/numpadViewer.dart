import 'package:flutter/material.dart';

import '../atomic/texts.dart';

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

String? getCh(String s, int idx) {
  try {
    return s[idx];
  } catch (e) {
    return null;
  }
}

class NumpadViewerContent extends StatelessWidget {
  final String currentNums;
  final bool isError;
  const NumpadViewerContent({
    Key? key,
    required this.currentNums,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final List<Widget> views = [];
    for (int idx = 0; idx < 6; idx += 1) {
      views.add(
        NumpadCharContainer(
          isError: isError,
          ch: getCh(currentNums, idx),
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: views,
    );
  }
}

class ShakeWidget extends StatelessWidget {
  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  const ShakeWidget({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    required this.child,
  }) : super(key: key);

  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.5 - (0.5 - curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: key,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, animation, child) => Transform.translate(
        offset: Offset(deltaX * shake(animation), 0),
        child: child,
      ),
      child: child,
    );
  }
}

class NumpadViewer extends StatelessWidget {
  final String currentNums;
  final bool isError;
  const NumpadViewer({
    Key? key,
    required this.currentNums,
    required this.isError,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final Widget content = NumpadViewerContent(
      currentNums: currentNums,
      isError: isError,
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: color.primary,
          ),
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: isError
          ? ShakeWidget(
              child: content,
            )
          : content,
    );
  }
}
