import 'package:file_ground_front/presentation/main/mainViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarOptions extends ConsumerWidget {
  const AppBarOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pushCreditPage =
        ref.read(mainViewModelProvider.notifier).pushCreditPage;
    final pushSettingPage =
        ref.read(mainViewModelProvider.notifier).pushSettingPage;
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          onTap: () {
            pushSettingPage(context);
          },
          child: const Text('설정'),
        ),
        PopupMenuItem(
          onTap: () {
            pushCreditPage(context);
          },
          child: const Text('크레딧'),
        ),
      ],
    );
  }
}
