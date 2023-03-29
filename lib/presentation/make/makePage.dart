import 'package:file_ground_front/presentation/common/atomic/paddings.dart';
import 'package:file_ground_front/presentation/common/atomic/texts.dart';
import 'package:file_ground_front/presentation/common/components/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final Widget child;
  final double width, height;
  final void Function()? onPressed;
  const PrimaryElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width = 300,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
        minimumSize: Size(width, height),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class DurationRadio extends StatelessWidget {
  final Duration current;
  final Duration value;
  final void Function(Duration?) onChanged;
  const DurationRadio({
    Key? key,
    required this.current,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Ink(
        decoration: BoxDecoration(
          color: value == current ? color.secondaryContainer : color.surface,
        ),
        child: Text(
          '${value.inHours}시간',
          style: TextStyle(
            fontSize: 20,
            color: color.onSecondaryContainer,
          ),
        ),
      ),
    );
  }
}

class DurationRadioPicker extends StatelessWidget {
  const DurationRadioPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = Duration(hours: 12);
    return Row(
      children: [
        DurationRadio(
          current: current,
          value: Duration(hours: 12),
          onChanged: (v) {},
        ),
        DurationRadio(
          current: current,
          value: Duration(hours: 24),
          onChanged: (v) {},
        ),
      ],
    );
  }
}

class MakePage extends StatelessWidget {
  const MakePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Padding(
      padding: getPagePadding(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: BoldText('시간 동안 유효한 그라운드 생성'),
        ),
        body: Column(
          children: [
            Divider(),
            DurationRadioPicker(),
            Divider(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          height: 300,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryElevatedButton(
                onPressed: () {},
                child: const Text(
                  '다음',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
