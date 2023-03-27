import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/animations/shakeWidget.dart';
import '../connectViewModel.dart';

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

class NumpadViewerContent extends ConsumerWidget {
  const NumpadViewerContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectState = ref.watch(connectViewModelProvider);
    final color = Theme.of(context).colorScheme;
    final List<Widget> views = [];
    for (int idx = 0; idx < 6; idx += 1) {
      views.add(
        NumpadCharContainer(
          isError: connectState.isError,
          ch: getCh(connectState.currentNums, idx),
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

class NumpadViewer extends ConsumerWidget {
  const NumpadViewer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isError =
        ref.watch(connectViewModelProvider.select((value) => value.isError));
    final color = Theme.of(context).colorScheme;
    const Widget content = NumpadViewerContent();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
              ? const ShakeWidget(
                  child: content,
                )
              : content,
        ),
        if (isError) DescriptionText('잘못된 좌표입니다.', color: color.error)
      ],
    );
  }
}
