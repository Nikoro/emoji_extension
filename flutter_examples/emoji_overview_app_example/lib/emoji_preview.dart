import 'package:flutter/material.dart';

class EmojiPreview extends StatelessWidget {
  const EmojiPreview(this.value, {required this.size, super.key});

  final String value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: value,
      child: Text(value, style: TextStyle(fontSize: size)),
    );
  }
}
