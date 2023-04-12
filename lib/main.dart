import 'package:file_ground_front/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'infrastructure/providers/authProvider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

// DotEnv dotenv = DotEnv() is automatically called during import.
// If you want to load multiple dotenv files or name your dotenv object differently, you can do the following and import the singleton into the relavant files:
// DotEnv another_dotenv = DotEnv()

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const CircularProgressIndicator(),
    ),
  );
  await dotenv.load(fileName: ".env");
  await container.read(authUseCaseProvider.notifier).init();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
