import 'package:dio/dio.dart';
import 'package:file_ground_front/domain/models/session.dart';

import 'package:file_ground_front/domain/models/user.dart';

import 'package:file_ground_front/domain/result/result.dart';

import '../../application/ports/authRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<Result<String>> getAuthUrlWithNaver() {
    // TODO: implement getAuthUrlWithNaver
    throw UnimplementedError();
  }

  @override
  Future<Result<Session>> loadSession() {
    // TODO: implement loadSession
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> renewAccessToken() {
    // TODO: implement renewAccessToken
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> renewRefreshToken() {
    // TODO: implement renewRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<void> saveSession(Session session) {
    // TODO: implement saveSession
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
