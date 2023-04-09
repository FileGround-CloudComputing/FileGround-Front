import 'package:file_ground_front/presentation/common/atomic/paddings.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:file_ground_front/presentation/ground/groundViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/ground.dart';

class Some extends ConsumerWidget {
  const Some({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ground =
        ref.watch(groundViewModelProvider.select((value) => value.ground));
    if (ground == null) {
      return CircularProgressIndicator();
    }
    return Text(ground.toString());
  }
}

class GroundPage extends ConsumerWidget {
  final String groundId;
  const GroundPage({Key? key, required this.groundId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ground =
        ref.watch(groundViewModelProvider.select((value) => value.ground));
    if (ground.id == null) {
      context.go('null');
    }
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: getPagePadding(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: BoldText(
            '그라운드 좌표 입력',
            color: color.onBackground,
          ),
        ),
        body: Placeholder(
          child: Some(),
        ),
      ),
    );
  }
}
