import 'package:file_ground_front/presentation/pages/mainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainPage(),
    ),
  ],
);
