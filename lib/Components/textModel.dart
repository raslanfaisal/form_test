import 'package:flutter/material.dart';

class TextModel extends StatelessWidget {
  const TextModel(
      {super.key,
      required this.text,
      required this.FontSize,
      required this.color});
  final String text;
  final double FontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: FontSize, color: color, fontFamily: 'ProtestRevolution'),
      ),
    );
  }
}
