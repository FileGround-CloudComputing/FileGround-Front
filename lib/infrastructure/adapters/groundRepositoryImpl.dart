import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_ground_front/application/ports/groundRepository.dart';
import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:file_ground_front/domain/models/ground.dart';
import 'package:file_ground_front/domain/models/photo.dart';
import 'package:file_ground_front/domain/result/result.dart';

class GroundRepositoryImpl extends GroundRepository {
  Dio dioAuth;
  Dio dio;
  GroundRepositoryImpl({
    required this.dioAuth,
    required this.dio,
  });

  @override
  Future<Result<Ground>> addGround(Ground ground) async {
    final Response result;
    try {
      result = await dioAuth.post('/ground', data: ground.toJson());
    } on Failure catch (failure) {
      return Result.error(failure);
    } catch (e) {
      return const Result.error(Failure.badRequest());
    }
    try {
      final data = Ground.fromJson(result.data);
      return Result.success(data);
    } catch (e) {
      return Result.error(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Result<Ground>> getGround(String id) async {
    final Response result;
    try {
      result = await dio.get('/ground/$id');
    } on Failure catch (failure) {
      return Result.error(failure);
    } catch (e) {
      return const Result.error(Failure.badRequest());
    }
    try {
      final data = Ground.fromJson(result.data);
      return Result.success(data);
    } catch (e) {
      return Result.error(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Result<Grounds>> getGrounds() async {
    final Response result;
    try {
      result = await dioAuth.get('/ground');
    } on Failure catch (failure) {
      return Result.error(failure);
    } catch (e) {
      return const Result.error(Failure.badRequest());
    }
    try {
      return Result.success(result.data);
    } catch (e) {
      return Result.error(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Result<List<Photo>>> getPhotos(Ground ground) async {
    final Response result;
    try {
      result = await dioAuth.get('/ground/${ground.id}');
    } on Failure catch (failure) {
      return Result.error(failure);
    } catch (e) {
      return const Result.error(Failure.badRequest());
    }
    try {
      final data = Photos.fromJson(result.data);
      return Result.success(data.data);
    } catch (e) {
      return Result.error(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Result<bool>> removeGround(Ground ground) async {
    try {} on Failure catch (failure) {
      return Result.error(failure);
    } catch (e) {
      return const Result.error(Failure.badRequest());
    }
    return const Result.success(true);
  }
}
