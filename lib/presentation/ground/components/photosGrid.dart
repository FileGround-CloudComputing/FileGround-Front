import 'package:file_ground_front/domain/models/photo.dart';
import 'package:file_ground_front/presentation/ground/groundViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectablePhoto extends ConsumerWidget {
  final Photo photo;
  const SelectablePhoto({
    required this.photo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Ink(
      decoration: photo.isSelected
          ? BoxDecoration(
              border: Border.all(
              color: Colors.black,
              width: 3,
            ))
          : null,
      child: Stack(
        fit: StackFit.expand,
        children: [
          InkWell(
            onLongPress: () {
              if (photo.isSelected) {
                ref.read(groundViewModelProvider.notifier).unSelectPhoto(photo);
              } else {
                ref.read(groundViewModelProvider.notifier).selectPhoto(photo);
              }
            },
            child: Image.network(
              photo.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
          if (photo.isSelected)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  ref
                      .read(groundViewModelProvider.notifier)
                      .unSelectPhoto(photo);
                },
                icon: const Icon(Icons.remove_circle),
              ),
            ),
        ],
      ),
    );
  }
}

class SelectOptions extends ConsumerWidget {
  const SelectOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectCount =
        ref.watch(groundViewModelProvider.select((value) => value.selectCount));
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${selectCount}개 선택'),
        ElevatedButton(
            onPressed: () {
              ref.read(groundViewModelProvider.notifier).download();
            },
            child: const Text('다운로드')),
        TextButton(
            onPressed: () {
              ref.read(groundViewModelProvider.notifier).selectAll();
            },
            child: const Text('모두 선택')),
        TextButton(
          onPressed: () {
            ref.read(groundViewModelProvider.notifier).unSelectAll();
          },
          child: const Text(
            '모두 취소',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
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
    final isSelecting =
        ref.watch(groundViewModelProvider.select((value) => value.isSelecting));
    return Column(
      children: [
        if (isSelecting) const SelectOptions(),
        GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            ...photos.map(
              (photo) => SelectablePhoto(
                photo: photo,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
