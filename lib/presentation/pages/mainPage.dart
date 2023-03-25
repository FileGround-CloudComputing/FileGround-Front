import 'package:file_ground_front/presentation/atomic/containers.dart';
import 'package:file_ground_front/presentation/components/customAppBar.dart';
import 'package:file_ground_front/presentation/components/iconTitleDesc.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        body: const RoundedSurfaceContainer(
          width: double.infinity,
          height: 300,
          child: IconTitleDesc(
            icon: Icons.abc,
            title: '그라운드 만들기',
            description: 'Ground를 만들어 파일을 공유해보세요',
          ),
        ),
      ),
    );
  }
}
