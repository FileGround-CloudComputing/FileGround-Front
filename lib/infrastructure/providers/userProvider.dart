import 'package:file_ground_front/application/ports/userRepository.dart';
import 'package:file_ground_front/application/usecases/userUseCase.dart';
import 'package:file_ground_front/infrastructure/adapters/userRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/user.dart';
import '../dio/dioProvider.dart';

final userUseCaseProvider =
    StateNotifierProvider<UserUseCase, User?>((Ref ref) {
  final dioAuth = ref.watch(dioAuthProvider);
  UserRepository userRepository = UserRepositoryImpl(dioAuth: dioAuth);
  final notifier = UserUseCase(userRepository: userRepository);
  notifier.init();
  return notifier;
});
