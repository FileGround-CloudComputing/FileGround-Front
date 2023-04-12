import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/presentation/connect/connectViewModel.dart';
import 'package:file_ground_front/presentation/connect/states/connectState.dart';
import 'package:file_ground_front/presentation/ground/states/groundState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/models/ground.dart';

class GroundViewModel extends StateNotifier<GroundState> {
  Ref ref;
  GroundViewModel({required this.ref}) : super(const GroundState());
  void init(String groundId, BuildContext context) async {
    setLoading();
    final result =
        await ref.read(groundUseCaseProvider.notifier).getGround(groundId);

    result.when(success: (Ground ground) {
      state = state.copyWith(ground: ground, isLoading: false);
    }, error: (e) {
      context.go('/null');
    });
  }

  void setLoading() {
    state = state.copyWith(isLoading: true);
  }
}

final groundViewModelProvider =
    StateNotifierProvider.autoDispose<GroundViewModel, GroundState>(
  (Ref ref) {
    final notifier = GroundViewModel(ref: ref);
    return notifier;
  },
);
