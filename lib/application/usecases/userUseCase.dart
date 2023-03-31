import 'package:file_ground_front/application/ports/userRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/session.dart';
import '../../domain/models/user.dart';

class UserUseCase extends StateNotifier<User?> {
  UserRepository userRepository;
  UserUseCase({
    required this.userRepository,
  }) : super(null);

  Future<void> init() async {
    await getInfo();
  }

  void clearUser() {
    state = null;
  }

  Future<void> getInfo() async {
    final result = await userRepository.getInfo();
    result.when(
      success: (User user) {
        state = user;
      },
      error: (e) {},
    );
  }
}
