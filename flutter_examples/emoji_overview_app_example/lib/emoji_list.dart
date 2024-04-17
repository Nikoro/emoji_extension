import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_overview_app_example/emoji_tile.dart';
import 'package:flutter/material.dart';

class EmojiList extends StatelessWidget {
  const EmojiList({super.key, required this.emojis});

  final List<Emoji> emojis;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => EmojiTile(emoji: emojis[index]),
      itemCount: emojis.length,
    );
  }
}
