import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_overview_app_example/emoji_preview.dart';
import 'package:emoji_overview_app_example/text_row.dart';
import 'package:flutter/material.dart';

class EmojiPage extends StatelessWidget {
  const EmojiPage({super.key, required this.emoji});

  final Emoji emoji;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(emoji.name)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Center(child: EmojiPreview(emoji.value, size: 80)),
          TextRow(title: 'Apple name', emoji.appleName),
          TextRow(title: 'Also known as', emoji.alsoKnownAs.join(', ')),
          TextRow(title: 'Color', emoji.color),
          TextRow(title: 'Shortcode', emoji.shortcode),
          TextRow(title: 'CLDR shortcode', emoji.cldrShortcode),
          TextRow(title: 'Discord shortcode', emoji.discordShortcode),
          TextRow(title: 'Github shortcode', emoji.githubShortcode),
          TextRow(title: 'Slack shortcode', emoji.slackShortcode),
          TextRow(title: 'Unicode', emoji.unicode),
          TextRow(title: 'Group', emoji.group),
          TextRow(title: 'Subgroup', emoji.subgroup),
          TextRow(title: 'Status', emoji.status),
          TextRow(title: 'isAnimal', emoji.isAnimal),
          TextRow(title: 'isFlag', emoji.isFlag),
          TextRow(title: 'isFlower', emoji.isFlower),
          TextRow(title: 'isFruit', emoji.isFruit),
          TextRow(title: 'isVegetable', emoji.isVegetable),
          TextRow(title: 'isGeometric', emoji.isGeometric),
          TextRow(title: 'isMan', emoji.isMan),
          TextRow(title: 'isWoman', emoji.isWoman),
          TextRow(title: 'isPerson', emoji.isPerson),
          TextRow(title: 'isMultiPerson', emoji.isMultiPerson),
          TextRow(title: 'isSymbol', emoji.isSymbol),
          TextRow(title: 'hasBeard', emoji.hasBeard),
          TextRow(title: 'hasFace', emoji.hasFace),
          TextRow(title: 'hasColor', emoji.hasColor),
          TextRow(title: 'hasHairStyle', emoji.hasHairStyle),
          TextRow(title: 'hasSkinTone', emoji.hasSkinTone),
          TextRow(title: 'hairStyle', emoji.hairStyle),
          TextRow(title: 'skinTone', emoji.skinTone),
        ],
      ),
    );
  }
}
