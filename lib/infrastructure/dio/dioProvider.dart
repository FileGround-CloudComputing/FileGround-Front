import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/authProvider.dart';

final dioProvider = Provider<Dio>((Ref ref) {
  return Dio();
});

final dioAuthProvider = Provider<Dio>((Ref ref) {
  final session = ref.watch(authProvider);
  final authUseCase = ref.read(authProvider.notifier);
  final dio = Dio();
  dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handler) async {
    if (session == null) {
      authUseCase.signOut();
      return;
    }
    await authUseCase.renewAccessToken();
    option.headers['Authorization'] =
        '${session.tokenType} ${session.accessToken}';
    return handler.next(option);
  }));
  return dio;
});
