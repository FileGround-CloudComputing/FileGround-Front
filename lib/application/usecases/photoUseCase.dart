import 'package:file_ground_front/application/ports/photoRepository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/photo.dart';

class PhotoUseCase extends StateNotifier<void> {
  PhotoRepository photoRepository;
  PhotoUseCase({
    required this.photoRepository,
  }) : super(null);
  Future<bool> downloadPhotos(List<Photo> photos) {
    if (kIsWeb) {
      for (final photo in photos) {
        photoRepository.downloadPhoto(photo);
      }
    }
    return Future.microtask(() => true);
  }
}
