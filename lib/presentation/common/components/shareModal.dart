import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareModal extends StatelessWidget {
  final String groundId;
  const ShareModal({
    Key? key,
    required this.groundId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = '${Uri.base.origin}/#/$groundId';
    return AlertDialog(
      title: const BoldText('공유하기'),
      actions: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close),
        )
      ],
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/logo.png',
              width: 100,
              height: 100,
            ),
            QrImage(
              data: url,
              version: QrVersions.auto,
              size: 200.0,
              eyeStyle: const QrEyeStyle(
                  color: Colors.green, eyeShape: QrEyeShape.square),
            ),
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: url));
                const snackBar = SnackBar(
                  content: Text(
                    '클립보드에 복사됐습니다.',
                    style: TextStyle(color: Colors.white),
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: BoldText(url),
            ),
          ],
        ),
      ),
    );
  }
}
