import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/presentation/make/states/makeStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/ground.dart';
import '../common/components/failureDialog.dart';

class MakePageViewModel extends StateNotifier<MakeState> {
  final Ref ref;
  MakePageViewModel({required this.ref}) : super(const MakeState());

  void updateDuration(Duration newDuration) {
    state = state.copyWith(groundDuration: newDuration);
  }

  void updateTitle(String title) {
    if (title.isNotEmpty && title.length < 20) {
      state = state.copyWith(groundTitle: title, isValid: true);
    } else {
      state = state.copyWith(isValid: false);
    }
  }

  void handlePostGround(BuildContext context) async {
    final res = await ref.read(groundUseCaseProvider.notifier).addGround(
          Ground(
            title: state.groundTitle,
            expiresIn: DateTime.now().add(state.groundDuration),
          ),
        );
    res.when(
      success: (Ground ground) {
        context.pop();
      },
      error: (Failure e) {
        showDialog(
          context: context,
          builder: (context) => FailureDialog(failure: e),
        );
      },
    );
  }
}

final makePageViewModelProvider =
    StateNotifierProvider.autoDispose<MakePageViewModel, MakeState>(
  (ref) {
    final notifier = MakePageViewModel(ref: ref);
    return notifier;
  },
);
