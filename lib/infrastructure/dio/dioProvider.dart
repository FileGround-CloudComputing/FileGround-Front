import 'package:dio/dio.dart';
import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/session.dart';
import '../providers/authProvider.dart';

final dioProvider = Provider<Dio>((Ref ref) {
  return Dio(BaseOptions(
    baseUrl: 'http://localhost:8000',
    connectTimeout: const Duration(seconds: 2),
  ));
});

final dioAuthProvider = Provider<Dio>((Ref ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8000',
    connectTimeout: const Duration(seconds: 2),
  ));
  dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handler) async {
    final result =
        await ref.watch(authUseCaseProvider.notifier).renewAccessToken();
    result.when(
      success: (String accessToken) {
        option.headers['Authorization'] = 'Bearer ${accessToken}';
        return handler.next(option);
      },
      error: (Failure e) {
        throw e;
      },
    );
  }));
  return dio;
});
