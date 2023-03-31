import 'package:file_ground_front/domain/constants/paths.dart';
import 'package:file_ground_front/infrastructure/providers/authProvider.dart';
import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/infrastructure/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/models/ground.dart';
import '../../domain/models/session.dart';
import '../../domain/models/user.dart';

class MainViewModel extends StateNotifier<void> {
  Ref ref;
  MainViewModel({
    required this.ref,
  }) : super(null);

  void init() async {
    await ref.read(userUseCaseProvider.notifier).init();
    await ref.read(groundUseCaseProvider.notifier).loadGrounds();
  }

  void pushConnectPage(BuildContext context) {
    context.push(CONNECT_PAGE_PATH);
  }

  void pushCreditPage(BuildContext context) {
    context.push(CREDIT_PAGE_PATH);
  }

  void pushSettingPage(BuildContext context) {
    context.push(SETTING_PAGE_PATH);
  }

  void pushMakePage(BuildContext context) {
    context.push(MAKE_PAGE_PATH);
  }
}

final mainViewModelProvider = StateNotifierProvider<MainViewModel, void>(
  (ref) {
    final notifier = MainViewModel(ref: ref);
    notifier.init();
    return notifier;
  },
);
