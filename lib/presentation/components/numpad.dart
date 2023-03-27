import 'package:file_ground_front/presentation/atomic/buttons.dart';
import 'package:file_ground_front/presentation/atomic/texts.dart';
import 'package:file_ground_front/presentation/viewModels/connect/connectViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'numpadViewer.dart';

class Numpad extends ConsumerWidget {
  const Numpad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleNumInput =
        ref.read(connectViewModelProvider.notifier).handleNumInput;
    final handleRemove =
        ref.read(connectViewModelProvider.notifier).handleRemove;
    final connectState = ref.watch(connectViewModelProvider);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: NumpadViewer(
                currentNums: connectState.currentNums,
                isError: connectState.isError,
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 400,
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                for (int num = 1; num < 10; num += 1)
                  NumpadButton(
                    num: num.toString(),
                    onPressed: () {
                      handleNumInput(num: num.toString(), context: context);
                    },
                  ),
                const SizedBox(),
                NumpadButton(
                  num: '0',
                  onPressed: () {
                    handleNumInput(num: '0', context: context);
                  },
                ),
                NumpadRemoveButton(
                  onPressed: () {
                    handleRemove();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
