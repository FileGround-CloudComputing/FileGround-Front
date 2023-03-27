import 'package:dio/dio.dart';
import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/authProvider.dart';

final dioProvider = Provider<Dio>((Ref ref) {
  return Dio(BaseOptions(
    baseUrl: '',
    connectTimeout: const Duration(seconds: 5),
  ));
});

final dioAuthProvider = Provider<Dio>((Ref ref) {
  final session = ref.watch(authUseCaseProvider);
  final authUseCase = ref.read(authUseCaseProvider.notifier);
  final dio = Dio(BaseOptions(
    baseUrl: '',
    connectTimeout: const Duration(seconds: 5),
  ));
  dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handler) async {
    if (session == null) {
      authUseCase.signOut();
      throw const Failure.unauthorized();
    }
    await authUseCase.renewAccessToken();
    option.headers['Authorization'] =
        '${session.tokenType} ${session.accessToken}';
    return handler.next(option);
  }));
  return dio;
});
