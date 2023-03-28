import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:file_ground_front/domain/models/session.dart';

import 'package:file_ground_front/domain/models/user.dart';

import 'package:file_ground_front/domain/result/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../application/dto/authDto.dart';
import '../../application/ports/authRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;
  final FlutterSecureStorage secureStorage;
  AuthRepositoryImpl({required this.dio, required this.secureStorage});

  @override
  Future<Result<String>> getAuthUrlWithNaver() {
    // TODO: implement getAuthUrlWithNaver
    throw UnimplementedError();
  }

  @override
  Future<void> saveSession(Session session) async {
    await secureStorage.write(key: 'refresh', value: session.refreshToken);
    await secureStorage.write(
        key: 'refresh-expire', value: session.refreshTokenExpiresIn.toString());
  }

  @override
  Future<Result<Session>> loadSession() async {
    final refreshToken = await secureStorage.read(key: 'refresh');
    if (refreshToken == null) {
      return const Result.error(Failure.empty());
    }
    final refreshTokenExpiresIn =
        await secureStorage.read(key: 'refresh-expire');

    // TODO parse 과정에서 잠재적인 오류 발생 가능.
    return Result.success(Session(
      refreshToken: refreshToken,
      refreshTokenExpiresIn: DateTime.parse(refreshTokenExpiresIn!),
    ));
  }

  @override
  Future<Result<AccessTokenDto>> renewAccessToken(Session session) async {
    final Response result;
    try {
      result = await dio.get(
        '/auth/access',
        options: Options(
          headers: {
            'a': session.refreshToken,
          },
        ),
      );
    } on Failure catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Failure.unprocessableEntity(message: e.toString()));
    }

    try {
      return Result.success(AccessTokenDto.fromJson(result.data));
    } catch (e) {
      return Result.error(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Result<Session>> renewRefreshToken() {
    // TODO: implement renewRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<void> signOut(Session session) async {
    if (session.accessToken == null) {
      return;
    }
    final result = await dio.delete(
      '/auth',
      options: Options(
        headers: {
          'accessToken': session.accessToken!,
        },
      ),
    );
  }
}
