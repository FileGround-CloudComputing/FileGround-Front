import 'package:file_ground_front/domain/constants/paths.dart';
import 'package:file_ground_front/infrastructure/providers/authProvider.dart';
import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/infrastructure/providers/userProvider.dart';
import 'package:file_ground_front/presentation/main/states/mainState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/models/ground.dart';
import '../../domain/models/session.dart';
import '../../domain/models/user.dart';

class MainViewModel extends StateNotifier<MainState> {
  Ref ref;
  final User? user;
  final Grounds grounds;
  final Session? session;
  MainViewModel({
    required this.ref,
    required this.user,
    required this.grounds,
    required this.session,
  }) : super(MainState(user: user, grounds: grounds));

  void init() async {
    ref.read(userUseCaseProvider.notifier).init();
    ref.read(groundUseCaseProvider.notifier).loadGrounds();
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
}

final mainViewModelProvider =
    StateNotifierProvider.autoDispose<MainViewModel, MainState>(
  (ref) {
    final session = ref.watch(authUseCaseProvider);
    final user = ref.watch(userUseCaseProvider);
    final grounds = ref.watch(groundUseCaseProvider);
    final notifier =
        MainViewModel(ref: ref, grounds: grounds, user: user, session: session);
    return notifier;
  },
);
