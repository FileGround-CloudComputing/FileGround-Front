import 'package:dio/dio.dart';
import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/session.dart';
import '../providers/authProvider.dart';

final dioProvider = Provider<Dio>((Ref ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://3545a35c-f83d-48a5-812d-3fa3983ceec7.mock.pstmn.io',
    connectTimeout: const Duration(seconds: 2),
  ));
});

final dioAuthProvider = Provider<Dio>((Ref ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://3545a35c-f83d-48a5-812d-3fa3983ceec7.mock.pstmn.io',
    connectTimeout: const Duration(seconds: 2),
  ));
  dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handler) async {
    Session? session = ref.read(authUseCaseProvider);
    if (session == null) {
      throw const Failure.unauthorized();
    }

    await ref.read(authUseCaseProvider.notifier).renewAccessToken();
    option.headers['Authorization'] =
        '${session!.tokenType} ${ref.read(authUseCaseProvider)!.accessToken}';
    return handler.next(option);
  }));
  return dio;
});
