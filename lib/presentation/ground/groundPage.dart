import 'package:file_ground_front/presentation/common/atomic/paddings.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:file_ground_front/presentation/common/components/shareModal.dart';
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
    return Text(ground.toString());
  }
}

class PhotosGrid extends ConsumerWidget {
  const PhotosGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref
        .watch(groundViewModelProvider.select((value) => value.ground!.photos));
    return GridView.count(
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        ...photos.map(
          (photo) => Image.network(
            photo.thumbnail,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class GroundPage extends ConsumerStatefulWidget {
  final String groundId;
  const GroundPage({Key? key, required this.groundId}) : super(key: key);

  @override
  ConsumerState createState() => _GroundPageState();
}

class _GroundPageState extends ConsumerState<GroundPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(groundViewModelProvider.notifier)
          .init(widget.groundId, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(groundViewModelProvider.select((value) => value.isLoading));
    if (isLoading) {
      return CircularProgressIndicator();
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
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return ShareModal(groundId: widget.groundId);
                    },
                  );
                },
                icon: Icon(Icons.share),
              ),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhotosGrid(),
            ],
          )),
    );
  }
}
