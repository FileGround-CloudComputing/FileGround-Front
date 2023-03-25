import 'package:file_ground_front/presentation/atomic/containers.dart';
import 'package:file_ground_front/presentation/components/customAppBar.dart';
import 'package:file_ground_front/presentation/components/iconTitleDesc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../atomic/paddings.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: getPagePadding(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        body: Column(
          children: [
            RoundedSurfaceInk(
              width: double.infinity,
              onTap: () {},
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
                context.push('/connect');
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
              onTap: () {},
              child: const IconTitleDesc(
                icon: Icons.coffee,
                title: '생성 내역',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
