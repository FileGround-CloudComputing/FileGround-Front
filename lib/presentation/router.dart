import 'package:file_ground_front/presentation/pages/connectPage.dart';
import 'package:file_ground_front/presentation/pages/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: ConnectPage(),
        transitionDuration: Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/connect',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: ConnectPage(),
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
