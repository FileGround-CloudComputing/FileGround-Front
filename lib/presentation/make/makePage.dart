import 'package:file_ground_front/presentation/common/atomic/paddings.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:file_ground_front/presentation/common/components/customAppBar.dart';
import 'package:file_ground_front/presentation/make/components/titleTextField.dart';
import 'package:file_ground_front/presentation/make/makePageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/atomic/buttons.dart';
import 'components/durationRadio.dart';

class MakePage extends ConsumerWidget {
  const MakePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final currentDuration = ref.watch(
        makePageViewModelProvider.select((value) => value.groundDuration));
    final isValid =
        ref.watch(makePageViewModelProvider.select((value) => value.isValid));
    final handlePostGround =
        ref.read(makePageViewModelProvider.notifier).handlePostGround;
    return Scaffold(
      appBar: CustomAppBar(
        title: BoldText('${currentDuration.inHours}시간 동안 유효한 그라운드 생성'),
      ),
      body: Center(
        child: Column(
          children: const [
            DurationRadioPicker(),
            SizedBox(
              height: 36,
            ),
            GroundTitleTextField(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 300,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryElevatedButton(
              isActive: isValid,
              onPressed: () {
                handlePostGround(context);
              },
              child: const Text(
                '다음',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
