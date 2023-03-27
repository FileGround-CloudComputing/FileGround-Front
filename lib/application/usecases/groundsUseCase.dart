import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/ground.dart';
import '../../domain/models/photo.dart';
import '../../domain/result/result.dart';
import '../ports/groundRepository.dart';

class GroundUseCase extends StateNotifier<Grounds> {
  GroundRepository groundRepository;
  GroundUseCase({
    required this.groundRepository,
  }) : super(const Grounds());

  Future<void> loadGrounds() async {
    final result = await groundRepository.getGrounds();
    result.when(
      success: (Grounds grounds) {
        state = grounds;
      },
      error: (err) {},
    );
  }

  Future<Result<Ground>> getGround(String id) async {
    return await groundRepository.getGround(id);
  }

  Future<void> removeGround(Ground ground) async {
    await groundRepository.removeGround(ground);
    return await loadGrounds();
  }

  Future<void> addGround(Ground ground) async {
    final result = await groundRepository.addGround(ground);
    result.when(
      success: (Ground ground) {
        state = state.copyWith(grounds: [...state.grounds, ground]);
      },
      error: (e) {},
    );
  }

  Future<Result<Ground>> getPhotos(Ground ground) async {
    final result = await groundRepository.getPhotos(ground);
    return result.when(
      success: (List<Photo> photos) {
        ground = ground.copyWith(photos: photos);
        return Result.success(ground);
      },
      error: (e) => Result.error(e),
    );
  }
}
