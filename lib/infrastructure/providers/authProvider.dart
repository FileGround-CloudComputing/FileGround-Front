import 'package:file_ground_front/application/ports/authRepository.dart';
import 'package:file_ground_front/application/usecases/authUseCase.dart';
import 'package:file_ground_front/infrastructure/dataSources/remote/secureStorageProvider.dart';
import 'package:file_ground_front/infrastructure/dio/dioProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/session.dart';
import '../adapters/authRepositoryImpl.dart';

final authProvider = StateNotifierProvider<AuthUseCase, Session?>((Ref ref) {
  final dio = ref.watch(dioProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  AuthRepositoryImpl authRepository =
      AuthRepositoryImpl(dio: dio, secureStorage: secureStorage);
  return AuthUseCase(authRepository: authRepository);
});
