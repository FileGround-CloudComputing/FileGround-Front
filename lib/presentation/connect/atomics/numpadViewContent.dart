import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../connectViewModel.dart';
import 'numpadCharContainer.dart';

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
          ch: connectState.getCh(idx),
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
