import 'package:file_ground_front/domain/constants/paths.dart';
import 'package:file_ground_front/domain/models/ground.dart';
import 'package:file_ground_front/presentation/connect/connectPage.dart';
import 'package:file_ground_front/presentation/credit/creditPage.dart';
import 'package:file_ground_front/presentation/error/NotFoundPage.dart';
import 'package:file_ground_front/presentation/ground/groundPage.dart';
import 'package:file_ground_front/presentation/main/mainPage.dart';
import 'package:file_ground_front/presentation/make/makePage.dart';
import 'package:file_ground_front/presentation/setting/settingPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (_, __) => const NotFoundPage(),
  routes: [
    GoRoute(
      path: HOME_PAGE_PATH,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const MainPage(),
        transitionDuration: const Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: CONNECT_PAGE_PATH,
      builder: (_, __) => const ConnectPage(),
    ),
    GoRoute(
      path: CREDIT_PAGE_PATH,
      builder: (_, __) => const CreditPage(),
    ),
    GoRoute(
      path: LICENSE_PAGE_PATH,
      builder: (_, __) => const LicensePage(),
    ),
    GoRoute(
      path: SETTING_PAGE_PATH,
      builder: (_, __) => const SettingPage(),
    ),
    GoRoute(
      path: MAKE_PAGE_PATH,
      builder: (_, __) => const MakePage(),
    ),
    GoRoute(
      path: GROUND_PAGE_PATH,
      builder: (_, state) {
        final gid = state.params['groundId'];

        if (gid == null) {
          return const NotFoundPage();
        }

        return GroundPage(
          groundId: gid,
        );
      },
    )
  ],
);
