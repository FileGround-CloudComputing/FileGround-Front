import 'package:file_ground_front/infrastructure/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  final WebViewController controller = WebViewController();
  @override
  void initState() async {
    super.initState();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setNavigationDelegate(
      NavigationDelegate(onPageStarted: (String url) {}),
    );
    final result = await ref.read(authUseCaseProvider.notifier).getAuthUrl();
    result.when(
      success: (String url) {
        controller.loadRequest(Uri.parse(url));
      },
      error: (e) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
