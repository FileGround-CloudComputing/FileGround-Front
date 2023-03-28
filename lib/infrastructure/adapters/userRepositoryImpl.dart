import 'package:dio/dio.dart';
import 'package:file_ground_front/application/ports/userRepository.dart';
import 'package:file_ground_front/domain/models/user.dart';
import 'package:file_ground_front/domain/result/result.dart';

import '../../domain/failure/failure.dart';

class UserRepositoryImpl extends UserRepository {
  Dio dioAuth;
  UserRepositoryImpl({
    required this.dioAuth,
  });

  @override
  Future<Result<User>> getInfo() async {
    final Response result;
    try {
      result = await dioAuth.get('/user');
    } on Failure catch (failure) {
      return Result.error(failure);
    } catch (e) {
      print(e);
      return const Result.error(Failure.badRequest());
    }
    try {
      final data = User.fromJson(result.data);
      return Result.success(data);
    } catch (e) {
      return Result.error(Failure.unprocessableEntity(message: e.toString()));
    }
  }
}
