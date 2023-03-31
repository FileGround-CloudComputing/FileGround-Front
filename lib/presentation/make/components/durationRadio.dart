import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../makePageViewModel.dart';

class DurationRadio extends ConsumerWidget {
  final Duration value;
  const DurationRadio({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final groundDuration = ref.watch(
        makePageViewModelProvider.select((value) => value.groundDuration));
    final updateDuration =
        ref.read(makePageViewModelProvider.notifier).updateDuration;
    return InkWell(
      onTap: () {
        updateDuration(value);
      },
      child: Ink(
        decoration: BoxDecoration(
          color: value == groundDuration
              ? color.secondaryContainer
              : color.surface,
        ),
        child: Text(
          '${value.inHours}시간',
          style: TextStyle(
            fontSize: 36,
            color: color.onSecondaryContainer,
          ),
        ),
      ),
    );
  }
}

class DurationRadioPicker extends StatelessWidget {
  const DurationRadioPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        DurationRadio(
          value: Duration(hours: 12),
        ),
        DurationRadio(
          value: Duration(hours: 24),
        ),
      ],
    );
  }
}
