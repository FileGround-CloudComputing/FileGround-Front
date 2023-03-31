import 'package:file_ground_front/domain/failure/failure.dart';
import 'package:flutter/material.dart';

class FailureDialogContent extends StatelessWidget {
  final Failure failure;
  const FailureDialogContent({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return failure.when(
      empty: () {
        return const Text('비었습니다');
      },
      unprocessableEntity: (String cause) {
        return Text('잘못 전달된 객체 ${cause}');
      },
      unauthorized: () {
        return const Text('인증 오류');
      },
      badRequest: () {
        return const Text('잘못된 요청');
      },
    );
  }
}

class FailureDialog extends StatelessWidget {
  final Failure failure;
  const FailureDialog({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('에러 발생'),
      content: FailureDialogContent(
        failure: failure,
      ),
    );
  }
}
