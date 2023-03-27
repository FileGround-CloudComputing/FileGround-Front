import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/presentation/connect/states/connectState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/ground.dart';

class ConnectViewModel extends StateNotifier<ConnectState> {
  Ref ref;
  ConnectViewModel({required this.ref}) : super(const ConnectState());

  void handleNumInput({required String num}) async {
    if (state.currentNums.length < 6) {
      state = state.copyWith(
        currentNums: state.currentNums + num,
        isError: false,
      );
    }
    if (state.currentNums.length == 6) {
      final result = await ref
          .read(groundUseCaseProvider.notifier)
          .getGround(state.currentNums);
      result.when(
        success: (Ground ground) {
          state = state.copyWith(isError: false);
        },
        error: (error) {
          state = state.copyWith(isError: true);
        },
      );
    }
  }

  void handleRemove() {
    state = state.copyWith(
      currentNums: state.currentNums.substring(0, state.currentNums.length - 1),
      isError: false,
    );
  }
}

final connectViewModelProvider =
    StateNotifierProvider<ConnectViewModel, ConnectState>(
  (ref) {
    final notifier = ConnectViewModel(ref: ref);
    return notifier;
  },
);
