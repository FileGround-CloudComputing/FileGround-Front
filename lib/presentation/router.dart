import 'package:file_ground_front/domain/constants/paths.dart';
import 'package:file_ground_front/presentation/connect/connectPage.dart';
import 'package:file_ground_front/presentation/credit/creditPage.dart';
import 'package:file_ground_front/presentation/main/mainPage.dart';
import 'package:file_ground_front/presentation/make/makePage.dart';
import 'package:file_ground_front/presentation/setting/settingPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: MainPage(),
        transitionDuration: Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: CONNECT_PAGE_PATH,
      builder: (_, __) => ConnectPage(),
    ),
    GoRoute(
      path: CREDIT_PAGE_PATH,
      builder: (_, __) => CreditPage(),
    ),
    GoRoute(
      path: LICENSE_PAGE_PATH,
      builder: (_, __) => LicensePage(),
    ),
    GoRoute(
      path: SETTING_PAGE_PATH,
      builder: (_, __) => SettingPage(),
    ),
    GoRoute(
      path: MAKE_PAGE_PATH,
      builder: (_, __) => MakePage(),
    )
  ],
);
