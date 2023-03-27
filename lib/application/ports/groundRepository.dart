import 'package:fpdart/fpdart.dart';

import '../../domain/models/ground.dart';
import '../../domain/models/photo.dart';
import '../../domain/result/result.dart';

abstract class GroundRepository {
  Future<Result<Grounds>> getGrounds();
  Future<Result<Ground>> getGround(String id);
  Future<Result<bool>> removeGround(Ground ground);
  Future<Result<bool>> addGround(Ground ground);
  Future<Result<List<Photo>>> getPhotos(Ground ground);
}
