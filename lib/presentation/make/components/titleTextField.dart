import 'package:file_ground_front/presentation/make/makePageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroundTitleTextField extends ConsumerWidget {
  const GroundTitleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateTitle =
        ref.read(makePageViewModelProvider.notifier).updateTitle;
    return SizedBox(
      width: 500,
      child: TextField(
        onChanged: updateTitle,
        style: TextStyle(
          fontSize: 26,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '이름',
        ),
      ),
    );
  }
}
