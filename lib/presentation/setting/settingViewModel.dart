import 'package:file_ground_front/application/usecases/authUseCase.dart';
import 'package:file_ground_front/application/usecases/userUseCase.dart';
import 'package:file_ground_front/infrastructure/providers/authProvider.dart';
import 'package:file_ground_front/infrastructure/providers/userProvider.dart';
import 'package:file_ground_front/presentation/common/components/failureDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingViewModel extends StateNotifier<void> {
  UserUseCase userUseCase;
  AuthUseCase authUseCase;
  Ref ref;
  SettingViewModel({
    required this.ref,
    required this.userUseCase,
    required this.authUseCase,
  }) : super(null);

  void mockLogin(BuildContext context) async {
    final result = await authUseCase.renewRefreshToken();
    result.when(success: (_) async {
      await userUseCase.getInfo();
    }, error: (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) => FailureDialog(failure: e),
      );
    });
  }

  void signOut(BuildContext context) async {
    final result = await authUseCase.signOut();
  }
}

final settingViewModelProvider = StateNotifierProvider<SettingViewModel, void>(
  (ref) {
    final notifier = SettingViewModel(
      ref: ref,
      authUseCase: ref.read(authUseCaseProvider.notifier),
      userUseCase: ref.read(userUseCaseProvider.notifier),
    );
    return notifier;
  },
);
