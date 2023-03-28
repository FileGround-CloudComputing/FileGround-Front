import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  const BoldText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize = 26,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  const DescriptionText(
    this.text, {
    Key? key,
    required this.color,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
