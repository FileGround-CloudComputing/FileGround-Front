import 'package:file_ground_front/presentation/common/atomic/paddings.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:flutter/material.dart';

import 'components/creditInfos.dart';

class CreditPage extends StatelessWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: BoldText(
          '크레딧',
          color: color.onBackground,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'frontend developed by 심규진',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('이 서비스는 굿락팀의 dropship을 모방하여 만들어진게 맞습니다.'),
            const CreditInfos(),
          ],
        ),
      ),
    );
  }
}
