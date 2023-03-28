import 'package:file_ground_front/infrastructure/providers/groundProvider.dart';
import 'package:file_ground_front/infrastructure/providers/userProvider.dart';
import 'package:file_ground_front/presentation/connect/states/connectState.dart';
import 'package:file_ground_front/presentation/main/states/mainState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/ground.dart';
import '../../domain/models/user.dart';
import '../connect/connectPage.dart';

class MainViewModel extends StateNotifier<MainState> {
  Ref ref;
  final User? user;
  final Grounds grounds;
  MainViewModel({
    required this.ref,
    required this.user,
    required this.grounds,
  }) : super(MainState(user: user, grounds: grounds));

  void init() {
    ref.read(groundUseCaseProvider.notifier).loadGrounds();
  }

  void pushConnectPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ConnectPage(),
      ),
    );
  }
}

final mainViewModelProvider = StateNotifierProvider<MainViewModel, MainState>(
  (ref) {
    final user = ref.watch(userUseCaseProvider);
    final grounds = ref.watch(groundUseCaseProvider);
    final notifier = MainViewModel(ref: ref, grounds: grounds, user: user);
    return notifier;
  },
);
