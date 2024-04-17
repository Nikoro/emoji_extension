import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_overview_app_example/emoji_page.dart';
import 'package:emoji_overview_app_example/emoji_preview.dart';
import 'package:flutter/material.dart';

class EmojiTile extends StatelessWidget {
  const EmojiTile({super.key, required this.emoji});

  final Emoji emoji;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => EmojiPage(emoji: emoji),
      )),
      leading: EmojiPreview(emoji.value, size: 30),
      title: Text(emoji.name),
      subtitle: Text(emoji.unicode),
    );
  }
}
