import 'package:file_ground_front/domain/constants/paths.dart';
import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/presentation/connect/states/connectState.dart';
import 'package:file_ground_front/presentation/ground/groundViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/models/ground.dart';

class ConnectViewModel extends StateNotifier<ConnectState> {
  Ref ref;
  ConnectViewModel({required this.ref}) : super(const ConnectState());

  void handleNumInput({
    required String num,
    required BuildContext context,
  }) async {
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
          successCallback(ground, context);
        },
        error: (error) {
          print(error);
          state = state.copyWith(isError: true);
        },
      );
    }
  }

  void successCallback(Ground ground, BuildContext context) {
    state = state.copyWith(isError: false, currentGround: ground);
    context.push('/${ground.id!}', extra: ground);
  }

  void handleRemove() {
    state = state.copyWith(
      currentNums: state.currentNums.substring(0, state.currentNums.length - 1),
      isError: false,
    );
  }
}

final connectViewModelProvider =
    StateNotifierProvider.autoDispose<ConnectViewModel, ConnectState>(
  (ref) {
    final notifier = ConnectViewModel(ref: ref);
    return notifier;
  },
);
