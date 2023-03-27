import 'package:fpdart/fpdart.dart';

import '../../domain/models/session.dart';
import '../../domain/models/user.dart';
import '../../domain/result/result.dart';

abstract class AuthRepository {
  /// Sign in with Naver
  Future<Result<String>> getAuthUrlWithNaver();

  /// Sign out
  Future<void> signOut();

  Future<Result<String>> renewAccessToken();

  Future<Result<String>> renewRefreshToken();

  /// Listen to auth changes
  void authStateChange(
    void Function(User? user) callback,
  );

  Future<void> saveSession(Session session);

  Future<Result<Session>> loadSession();
}
