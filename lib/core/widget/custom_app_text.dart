import 'package:flutter/material.dart';

class CustomAppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? weight;
  final Color? color;
  const CustomAppText(
      {super.key, required this.text, this.fontSize, this.weight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: weight ?? FontWeight.w500,
        color: color,
      ),
    );
  }
}
