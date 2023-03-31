import 'package:file_ground_front/presentation/make/states/makeStates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MakePageViewModel extends StateNotifier<MakeState> {
  MakePageViewModel() : super(const MakeState());

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
}

final makePageViewModelProvider =
    StateNotifierProvider.autoDispose<MakePageViewModel, MakeState>(
  (ref) {
    final notifier = MakePageViewModel();
    return notifier;
  },
);
