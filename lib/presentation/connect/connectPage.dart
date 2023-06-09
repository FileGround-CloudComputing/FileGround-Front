import 'package:file_ground_front/presentation/common/atomic/paddings.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:file_ground_front/presentation/connect/components/numpad.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: BoldText(
          '그라운드 좌표 입력',
          color: color.onBackground,
        ),
      ),
      body: Numpad(),
    );
  }
}
