import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/presentation/connect/connectViewModel.dart';
import 'package:file_ground_front/presentation/connect/states/connectState.dart';
import 'package:file_ground_front/presentation/ground/states/groundState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/ground.dart';

class GroundViewModel extends StateNotifier<GroundState> {
  Ref ref;
  GroundViewModel({required this.ref})
      : super(
          GroundState(
            ground: Ground(
              title: '1',
              expiresIn: DateTime.now(),
            ),
          ),
        );
  void init() {
    final ground = ref
        .read(connectViewModelProvider.select((value) => value.currentGround));
    if (ground == null) {
      return;
    }
    state = state.copyWith(
      ground: ground,
    );
  }
}

final groundViewModelProvider =
    StateNotifierProvider.autoDispose<GroundViewModel, GroundState>(
  (Ref ref) {
    final notifier = GroundViewModel(ref: ref);
    notifier.init();
    return notifier;
  },
);
