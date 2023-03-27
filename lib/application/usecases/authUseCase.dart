import 'package:file_ground_front/application/ports/authRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/models/session.dart';
import '../../domain/result/result.dart';

class AuthUseCase extends StateNotifier<Session?> {
  AuthRepository authRepository;
  AuthUseCase({
    required this.authRepository,
  }) : super(null);

  void init() {
    loadSession();
  }

  Future<Result<String>> getAuthUrl() async {
    return await authRepository.getAuthUrlWithNaver();
  }

  Future<void> renewAccessToken() async {
    final result = await authRepository.renewAccessToken();
    result.when(
      success: (String accessToken) {
        state = state?.copyWith(accessToken: accessToken);
      },
      error: (e) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    state = null;
    return await authRepository.signOut();
  }

  Future<void> saveSession() async {
    if (state == null) {
      return;
    }
    return await authRepository.saveSession(state!);
  }

  Future<void> loadSession() async {
    final result = await authRepository.loadSession();
    result.when(
      success: (Session loadedSession) {
        state = loadedSession;
      },
      error: (err) {},
    );
  }
}
