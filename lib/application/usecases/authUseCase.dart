import 'package:file_ground_front/application/dto/authDto.dart';
import 'package:file_ground_front/application/ports/authRepository.dart';
import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/models/session.dart';
import '../../domain/result/result.dart';

class AuthUseCase extends StateNotifier<Session?> {
  AuthRepository authRepository;

  AuthUseCase({
    required this.authRepository,
  }) : super(null);

  Future<void> init() async {
    await loadSession();
  }

  Future<Result<String>> getAuthUrl() async {
    return await authRepository.getAuthUrlWithNaver();
  }

  Future<Result<bool>> renewRefreshToken() async {
    final result = await authRepository.renewRefreshToken();
    return result.when(
      success: (Session session) {
        state = session;
        return const Result.success(true);
      },
      error: (e) {
        return const Result.error(Failure.unauthorized());
      },
    );
  }

  Future<Result<bool>> renewAccessToken() async {
    if (state == null) {
      return const Result.error(Failure.unauthorized());
    }
    final result = await authRepository.renewAccessToken(state!);
    return result.when(
      success: (AccessTokenDto accessTokenDto) {
        state = state?.copyWith(
          accessToken: accessTokenDto.accessToken,
          accessTokenExpiresIn: accessTokenDto.accessTokenExpiresIn,
        );
        saveSession();
        return const Result.success(true);
      },
      error: (e) {
        signOut();
        return const Result.error(Failure.unauthorized());
      },
    );
  }

  Future<void> signOut() async {
    if (state == null) {
      return;
    }
    await authRepository.signOut(state!);
    state = null;
  }

  Future<void> clearSession() async {
    return;
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
