import 'package:file_ground_front/domain/models/ground.dart';
import 'package:file_ground_front/presentation/main/mainViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroundInfo extends StatelessWidget {
  final Ground ground;
  const GroundInfo({
    Key? key,
    required this.ground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(ground.title),
        Text(ground.expiresIn),
        Text(ground.coordinate),
      ],
    );
  }
}

class GroundsList extends ConsumerWidget {
  const GroundsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(mainViewModelProvider.select((value) => value.user));
    final grounds =
        ref.watch(mainViewModelProvider.select((value) => value.grounds)).data;

    if (user == null) {
      return const Text('please login');
    }
    return Column(
      children: [
        ...grounds.map(
          (ground) => GroundInfo(
            ground: ground,
          ),
        ),
      ],
    );
  }
}
