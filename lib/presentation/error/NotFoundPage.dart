import 'package:file_ground_front/domain/constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExY2M3NjZjYTk0MmNjZTZjZTcwYTg4Y2VjOGM1YjVmM2Q4YzRmZDQzNCZjdD1n/THHP2j9L5yG5PZL0dy/giphy.gif"),
            const Text(
              '아무것도 모르겠는데 에베베베베',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(HOME_PAGE_PATH);
              },
              child: Text('홈으로 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }
}
