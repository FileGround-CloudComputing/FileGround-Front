import 'package:file_ground_front/application/dto/authDto.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/models/session.dart';
import '../../domain/models/user.dart';
import '../../domain/result/result.dart';

abstract class AuthRepository {
  /// Sign in with Naver
  Future<Result<String>> getAuthUrlWithNaver();

  /// Sign out
  Future<void> signOut(Session session);

  Future<Result<AccessTokenDto>> renewAccessToken(Session session);

  Future<Result<Session>> renewRefreshToken();

  Future<void> saveSession(Session session);

  Future<Result<Session>> loadSession();
}
