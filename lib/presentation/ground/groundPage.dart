import 'package:file_ground_front/presentation/common/atomic/paddings.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:file_ground_front/presentation/common/components/shareModal.dart';
import 'package:file_ground_front/presentation/ground/groundViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/ground.dart';
import 'components/photosGrid.dart';

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
      return const Center(child: CircularProgressIndicator());
    }
    final title = ref
        .watch(groundViewModelProvider.select((value) => value.ground!.title));
    final color = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: BoldText(
            title,
            color: color.onBackground,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                ref.read(groundViewModelProvider.notifier).imagePick();
              },
              icon: Icon(Icons.upload),
            ),
            IconButton(
              onPressed: () {
                ref
                    .read(groundViewModelProvider.notifier)
                    .openShareModal(context: context);
              },
              icon: Icon(Icons.share),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhotosGrid(),
            ],
          ),
        ));
  }
}
