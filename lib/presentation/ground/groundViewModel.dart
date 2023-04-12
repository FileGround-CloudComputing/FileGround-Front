import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/infrastructure/providers/photoProvider.dart';
import 'package:file_ground_front/presentation/common/components/failureDialog.dart';
import 'package:file_ground_front/presentation/connect/connectViewModel.dart';
import 'package:file_ground_front/presentation/connect/states/connectState.dart';
import 'package:file_ground_front/presentation/ground/states/groundState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/models/ground.dart';
import '../../domain/models/photo.dart';
import '../common/components/shareModal.dart';

class GroundViewModel extends StateNotifier<GroundState> {
  Ref ref;
  GroundViewModel({required this.ref}) : super(const GroundState());
  void init(String groundId, BuildContext context) async {
    setLoading();
    final result =
        await ref.read(groundUseCaseProvider.notifier).getGround(groundId);

    result.when(success: (Ground ground) {
      state = state.copyWith(ground: ground, isLoading: false);
    }, error: (e) {
      context.go('/null');
    });
  }

  void setLoading() {
    state = state.copyWith(isLoading: true);
  }

  void openShareModal({required BuildContext context}) {
    if (state.ground == null) {
      showDialog(
        context: context,
        builder: (_) {
          return const FailureDialog(
            failure: Failure.empty(),
          );
        },
      );
      return;
    }
    showDialog(
      context: context,
      builder: (_) {
        return ShareModal(groundId: state.ground!.id);
      },
    );
  }

  void imagePick() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
  }

  void updatePhotos(List<Photo> newPhotos, int affected) {
    state = state.copyWith(
      ground: state.ground!.copyWith(
        photos: newPhotos,
      ),
      selectCount: state.selectCount + affected,
      isSelecting: state.selectCount + affected != 0,
    );
  }

  void selectPhoto(Photo selectPhoto) async {
    if (state.ground == null) {
      return;
    }
    int affected = 0;
    final newPhotos = state.ground!.photos.map((photo) {
      if (photo.id == selectPhoto.id) {
        affected += 1;
        return photo.copyWith(isSelected: true);
      }
      return photo;
    });
    updatePhotos(newPhotos.toList(), affected);
  }

  void unSelectPhoto(Photo selectPhoto) async {
    if (state.ground == null) {
      return;
    }
    int affected = 0;
    final newPhotos = state.ground!.photos.map((photo) {
      if (photo.id == selectPhoto.id) {
        affected -= 1;

        return photo.copyWith(isSelected: false);
      }
      return photo;
    });
    updatePhotos(newPhotos.toList(), affected);
  }

  void selectAll() {
    if (state.ground == null) {
      return;
    }
    int affected = 0;
    final newPhotos = state.ground!.photos.map((photo) {
      if (!photo.isSelected) {
        affected += 1;
      }
      return photo.copyWith(isSelected: true);
    });
    updatePhotos(newPhotos.toList(), affected);
  }

  void unSelectAll() {
    if (state.ground == null) {
      return;
    }
    int affected = 0;
    final newPhotos = state.ground!.photos.map((photo) {
      if (photo.isSelected) {
        affected -= 1;
      }

      return photo.copyWith(isSelected: false);
    });
    updatePhotos(newPhotos.toList(), affected);
  }

  void download() {
    List<Photo> downloadPhoto = [];
    int affected = 0;
    final newPhotos = state.ground!.photos.map((photo) {
      if (!photo.isSelected) {
        return photo;
      }
      downloadPhoto.add(photo);
      affected -= 1;
      return photo.copyWith(isSelected: false);
    });
    updatePhotos(newPhotos.toList(), affected);
    ref.read(photoUseCaseProvider.notifier).downloadPhotos(downloadPhoto);
  }
}

final groundViewModelProvider =
    StateNotifierProvider.autoDispose<GroundViewModel, GroundState>(
  (Ref ref) {
    final notifier = GroundViewModel(ref: ref);
    return notifier;
  },
);
