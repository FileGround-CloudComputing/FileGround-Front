import 'package:file_ground_front/application/ports/photoRepository.dart';
import 'package:file_ground_front/application/ports/userRepository.dart';
import 'package:file_ground_front/application/usecases/photoUseCase.dart';
import 'package:file_ground_front/application/usecases/userUseCase.dart';
import 'package:file_ground_front/infrastructure/adapters/photoRepositoryImpl.dart';
import 'package:file_ground_front/infrastructure/adapters/userRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/user.dart';
import '../dio/dioProvider.dart';

final photoUseCaseProvider =
    StateNotifierProvider<PhotoUseCase, void>((Ref ref) {
  final dioAuth = ref.watch(dioAuthProvider);
  final dio = ref.watch(dioProvider);
  PhotoRepository photoRepository =
      PhotoRepositoryImpl(dioAuth: dioAuth, dio: dio);
  final notifier = PhotoUseCase(photoRepository: photoRepository);
  return notifier;
});
