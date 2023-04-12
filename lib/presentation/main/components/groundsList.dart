import 'package:file_ground_front/domain/models/ground.dart';
import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/infrastructure/providers/userProvider.dart';
import 'package:file_ground_front/presentation/common/atomic/containers.dart';
import 'package:file_ground_front/presentation/common/components/shareModal.dart';
import 'package:file_ground_front/presentation/main/mainViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GroundInfo extends StatelessWidget {
  final Ground ground;
  const GroundInfo({
    Key? key,
    required this.ground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedSurfaceInk(
      onTap: () {
        if (ground.id == null) {
          return;
        }
        context.go(ground.id!);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                ground.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                ground.id!,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text('${ground.getFormatExpireDate()}까지 유효'),
        ],
      ),
    );
  }
}

class GroundsList extends ConsumerWidget {
  const GroundsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userUseCaseProvider);
    final grounds = ref.watch(groundUseCaseProvider).data;

    if (user == null) {
      return TextButton(
        onPressed: () {
          ref.read(mainViewModelProvider.notifier).pushSettingPage(context);
        },
        child: const Text('please login'),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ...grounds.map(
            (ground) => Row(
              children: [
                Expanded(
                  child: GroundInfo(
                    ground: ground,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          if (ground.id == null) {
                            return Placeholder();
                          }
                          return ShareModal(groundId: ground.id!);
                        });
                  },
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
