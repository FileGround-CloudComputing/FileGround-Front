import 'package:dio/dio.dart';
import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/session.dart';
import '../providers/authProvider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final serverUrl = dotenv.env['SERVER_URL'] ?? "http://localhost:8080";
final dioProvider = Provider<Dio>((Ref ref) {
  return Dio(BaseOptions(
    baseUrl: serverUrl,
    headers: {'Content-Type': 'application/json'},
    connectTimeout: const Duration(seconds: 2),
  ));
});

final dioAuthProvider = Provider<Dio>((Ref ref) {
  final dio = Dio(BaseOptions(
    baseUrl: serverUrl,
    headers: {'Content-Type': 'application/json'},
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
        handler.reject(
          DioError(
            requestOptions: option,
            type: DioErrorType.badCertificate,
            error: e,
          ),
        );
      },
    );
  }));
  return dio;
});
