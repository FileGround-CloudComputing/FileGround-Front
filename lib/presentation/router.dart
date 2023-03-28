import 'package:file_ground_front/presentation/connect/connectPage.dart';
import 'package:file_ground_front/presentation/credit/creditPage.dart';
import 'package:file_ground_front/presentation/main/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: CreditPage(),
        transitionDuration: Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/ground/license',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: LicensePage(),
        transitionDuration: Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
  ],
);
