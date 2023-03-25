import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  const TitleText(
    this.text, {
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 26,
        color: color,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String text;
  final Color color;
  const DescriptionText(
    this.text, {
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        color: color,
      ),
    );
  }
}
