import 'package:emoji_extension/emoji_extension.dart';
import 'package:flutter/material.dart';

part '_emoji_message.dart';
part '_message_bubble.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return text.emojis.only
        ? _EmojiMessage(text: text)
        : _MessageBubble(text: text);
  }
}
