import 'package:file_ground_front/infrastructure/providers/userProvider.dart';
import 'package:file_ground_front/presentation/common/atomic/containers.dart';
import 'package:file_ground_front/presentation/common/atomic/paddings.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:file_ground_front/presentation/setting/settingViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginInfo extends ConsumerWidget {
  const LoginInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userUseCaseProvider);
    final signOut = ref.read(settingViewModelProvider.notifier).signOut;
    if (user == null) {
      return const SizedBox();
    }
    return Column(
      children: [
        RoundedSurfaceContainer(
          width: double.infinity,
          child: Text(user.name),
        ),
        RoundedSurfaceInk(
          onTap: () {
            signOut(context);
          },
          width: double.infinity,
          child: Text('로그아웃'),
        ),
      ],
    );
  }
}

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userUseCaseProvider);
    final mockLogin = ref.read(settingViewModelProvider.notifier).mockLogin;
    return Padding(
      padding: getPagePadding(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('설정'),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: [
              if (user == null)
                RoundedSurfaceInk(
                  onTap: () {
                    mockLogin(context);
                  },
                  width: double.infinity,
                  child: const BoldText(
                    '로그인을 해주세요.',
                    fontSize: 16,
                  ),
                ),
              LoginInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
