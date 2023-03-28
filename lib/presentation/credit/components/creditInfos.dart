import 'package:file_ground_front/presentation/common/atomic/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreditInfos extends StatelessWidget {
  const CreditInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Column(
      children: [
        RoundedBorderTextButton(
          onPressed: () {},
          child: Text(
            '이용약관',
            style: TextStyle(color: color.onBackground),
          ),
        ),
        const SizedBox(height: 16),
        RoundedBorderTextButton(
          onPressed: () {},
          child: Text(
            '운영정책',
            style: TextStyle(color: color.onBackground),
          ),
        ),
        const SizedBox(height: 16),
        RoundedBorderTextButton(
          onPressed: () {},
          child: Text(
            '개인정보 처리방침',
            style: TextStyle(color: color.onBackground),
          ),
        ),
        const SizedBox(height: 16),
        RoundedBorderTextButton(
          onPressed: () {
            context.go('/ground/license');
          },
          child: Text(
            '오픈소스 라이센스',
            style: TextStyle(color: color.onBackground),
          ),
        ),
      ],
    );
  }
}
