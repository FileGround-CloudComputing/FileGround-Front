import 'package:file_ground_front/application/ports/groundRepository.dart';
import 'package:file_ground_front/application/usecases/groundsUseCase.dart';
import 'package:file_ground_front/infrastructure/adapters/groundRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/ground.dart';
import '../dio/dioProvider.dart';

final groundUseCaseProvider =
    StateNotifierProvider<GroundUseCase, Grounds>((Ref ref) {
  final dio = ref.watch(dioProvider);
  final dioAuth = ref.watch(dioAuthProvider);
  GroundRepository groundRepository =
      GroundRepositoryImpl(dio: dio, dioAuth: dioAuth);
  final notifier = GroundUseCase(groundRepository: groundRepository);
  return notifier;
});
