import 'package:file_ground_front/domain/models/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/result/result.dart';

abstract class UserRepository {
  Future<Result<User>> getInfo();
}
