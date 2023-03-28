import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/animations/shakeWidget.dart';
import '../atomics/numpadViewContent.dart';
import '../connectViewModel.dart';

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
        isError
            ? DescriptionText('잘못된 좌표입니다.', color: color.error)
            : DescriptionText('', color: color.error)
      ],
    );
  }
}
