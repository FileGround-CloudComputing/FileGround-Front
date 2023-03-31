import 'package:file_ground_front/infrastructure/providers/authProvider.dart';
import 'package:file_ground_front/infrastructure/providers/userProvider.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:file_ground_front/presentation/connect/connectPage.dart';
import 'package:file_ground_front/presentation/main/components/groundsList.dart';
import 'package:file_ground_front/presentation/main/mainViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/atomic/containers.dart';
import '../common/atomic/paddings.dart';
import '../common/components/customAppBar.dart';
import '../common/components/iconTitleDesc.dart';
import 'components/appbarOptions.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final pushConnectPage =
        ref.read(mainViewModelProvider.notifier).pushConnectPage;
    final pushMakePage = ref.read(mainViewModelProvider.notifier).pushMakePage;
    return Padding(
      padding: getPagePadding(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: BoldText(
            'File Ground',
            color: color.primary,
          ),
          actions: const [
            AppBarOptions(),
          ],
        ),
        body: Column(
          children: [
            RoundedSurfaceInk(
              width: double.infinity,
              onTap: () {
                pushMakePage(context);
              },
              child: const IconTitleDesc(
                icon: Icons.coffee_maker,
                title: '그라운드 만들기',
                description: 'Ground를 만들어 공유를 시작해보세요.',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RoundedSurfaceInk(
              width: double.infinity,
              onTap: () {
                pushConnectPage(context);
              },
              child: const IconTitleDesc(
                icon: Icons.connect_without_contact,
                title: '그라운드 접속하기',
                description: 'Ground에 접속해서 공유를 시작해보세요.',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RoundedSurfaceInk(
              width: double.infinity,
              child: Column(
                children: const [
                  IconTitleDesc(
                    icon: Icons.coffee,
                    title: '생성 내역',
                  ),
                  GroundsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
