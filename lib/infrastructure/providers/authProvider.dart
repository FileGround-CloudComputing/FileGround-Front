import 'package:file_ground_front/application/ports/authRepository.dart';
import 'package:file_ground_front/application/usecases/authUseCase.dart';
import 'package:file_ground_front/infrastructure/dio/dioProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/session.dart';
import '../adapters/authRepositoryImpl.dart';
import '../dataSources/local/secureStorageProvider.dart';

final authUseCaseProvider =
    StateNotifierProvider<AuthUseCase, Session?>((Ref ref) {
  final dio = ref.read(dioProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  AuthRepositoryImpl authRepository =
      AuthRepositoryImpl(dio: dio, secureStorage: secureStorage);
  final notifier = AuthUseCase(authRepository: authRepository, ref: ref);
  return notifier;
});
