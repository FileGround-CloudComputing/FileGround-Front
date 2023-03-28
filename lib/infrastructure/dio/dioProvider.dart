import 'package:dio/dio.dart';
import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/authProvider.dart';

final dioProvider = Provider<Dio>((Ref ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://3545a35c-f83d-48a5-812d-3fa3983ceec7.mock.pstmn.io',
    connectTimeout: const Duration(seconds: 2),
  ));
});

final dioAuthProvider = Provider<Dio>((Ref ref) {
  final session = ref.watch(authUseCaseProvider);
  final authUseCase = ref.read(authUseCaseProvider.notifier);
  final dio = Dio(BaseOptions(
    baseUrl: 'https://3545a35c-f83d-48a5-812d-3fa3983ceec7.mock.pstmn.io',
    connectTimeout: const Duration(seconds: 2),
  ));
  dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handler) async {
    if (session == null) {
      authUseCase.signOut();
      throw const Failure.unauthorized();
    }
    await authUseCase.renewAccessToken();
    option.headers['Authorization'] =
        '${session!.tokenType} ${session.accessToken}';
    return handler.next(option);
  }));
  return dio;
});
