import 'package:emoji_extension/emoji_extension.dart';

void main() {
  final emojis = Emojis().get;
  // print(emojis);
  /* Emoji(
                   value: 😀,
                   unicode: 1F600,
                   name: Grinning Face,
                   group: Smileys & Emotion,
                   subgroup: face-smiling,
                   shortcodes: [
                            Shortcode(
                            platform: Discord,
                            value: grinning
                          ),
                            Shortcode(
                            platform: Github,
                            value: grinning
                          ),
                            Shortcode(
                            platform: Slack,
                            value: grinning
                          ),
                            Shortcode(
                            platform: Default,
                            value: grinning_face
                          ),
                            Shortcode(
                            platform: CLDR,
                            value: grinning_face
                          )]
                  ),
                  Emoji(
                   value: 😃,
                   unicode: 1F603,
                   name: Grinning face with big eyes,
                   group: Smileys & Emotion,
                   subgroup: face-smiling,
                   shortcodes: [...]
                  )
                 ...
                 ] */

  final values = emojis.values;
  // print(values); // [😀, 😃, 😄, 😁, 😆, 😅, 🤣, 😂, 🙂, 🙃, 🫠, 😉, 😊, 😇, 🥰, 😍, ...]

  final unicodes = emojis.unicodes;
  // print(unicodes); // [1F600, 1F603, 1F604, 1F601, 1F606, 1F605, 1F923, 1F602, 1F642, ...]

  final names = emojis.names;
  // print(names); // [Grinning face, Grinning face with big eyes, ...]

  final shortcodes = emojis.shortcodes;
  // print(shortcodes); // [:grinning_face:, :grinning_face_with_big_eyes:, ...]

  final cldrShortcodes = emojis.cldrShortcodes;
  // print(cldrShortcodes); // [:grinning_face:, :grinning_face_with_big_eyes:, ...]

  final discordShortcodes = emojis.discordShortcodes;
  // print(discordShortcodes); // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]

  final githubShortcodes = emojis.githubShortcodes;
  // print(githubShortcodes); // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]

  final slackShortcodes = emojis.slackShortcodes;
  // print(slackShortcodes); // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]

  final groups = Emojis().groups;
  // print(groups); // [Group.smileysAndEmotion, Group.peopleAndBody, Group.component, ...]
  // print(groups.values); // [Smileys & Emotion, People & Body, Component, Animals & Nature, ...]

  final subgroups = Emojis().subgroups;
  // print(subgroups); // [Subgroup.faceSmiling, Subgroup.faceAffection, Subgroup.faceTongue, ...]
  // print(subgroups.values); // face-smiling, face-affection, face-tongue, face-hand, ...]

  final groupsWithSubgroups = Emojis().groupsWithSubgroups;
  // print(groupsWithSubgroups); // {Group.smileysAndEmotion: [Subgroup.faceSmiling, ...], ...}

  final groupsWithSubgroupsValues = Emojis().groupsWithSubgroupsValues;
  // print(groupsWithSubgroupsValues); // {Smileys & Emotion: [face-smiling, ...], ...}

  final shortcodePlatforms = Emojis().shortcodePlatforms;
  // print(shortcodePlatforms); // [Default, CLDR, Discord, Github, Slack]

  final name = Emojis().getOne('😀').name;
  // print(name); // Grinning face

  final nameOrNull = Emojis().getOneOrNull('some broken value')?.name;
  // print(nameOrNull); // null

  final smileysAndEmotion = Emojis().smileysAndEmotion;
  // print(smileysAndEmotion); // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]

  final faceSmiling = Emojis().faceSmiling;
  // print(faceSmiling); // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]

  final any = '😀text😀'.emojis.any;
  // print(any); // true

  final only = '😀text😀'.emojis.only;
  // print(only); // true

  final onlyOne = '😀text😀'.emojis.onlyOne;
  // print(onlyOne); // true

  final count = '😀text😀'.emojis.count;
  // print(count); // 3

  final remove = '😀text😀'.emojis.remove;
  // print(remove); // text text text

  final split = '😀text😀'.emojis.split;
  // print(split); // [text, text]

  final extract = '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.extract;
  // print(extract); // [👍, 👍🏻, 👍🏼, 👍🏽, 👍🏾, 👍🏿]

  final emoji = '😀text'.emojis.get;
  // print(emoji);
  /* [Emoji(
                          value: 😀,
                          unicode: 1F600,
                          name: Grinning Face,
                          group: Smileys & Emotion,
                          subgroup: face-smiling,
                          shortcodes: [
                            Shortcode(
                            platform: Discord,
                            value: grinning
                          ),
                            Shortcode(
                            platform: Github,
                            value: grinning
                          ),
                            Shortcode(
                            platform: Slack,
                            value: grinning
                          ),
                            Shortcode(
                            platform: Default,
                            value: grinning_face
                          ),
                            Shortcode(
                            platform: CLDR,
                            value: grinning_face
                          )]
                        )] */

  final hasAny = '👍️text'.emojis.hasAny(['👍']);
  // print(hasAny); // true

  final hasEach = '👍️text'.emojis.hasEach(['👍']);
  // print(hasEach); // true

  final splitMapJoin = 'text😀text'.emojis.splitMapJoin(
        onMatch: (_) => '_emoji_',
        onNonMatch: (s) => s.toUpperCase(),
      );
  // print(splitMapJoin); // TEXT_emoji_TEXT

  final replace = '😀text👍'.emojis.replace('_');
  // print(replace); // _️text_

  final replaceEach =
      '😀text👍🏻text😀'.emojis.replaceEach({'😀': 'ABC', '👍🏻': '123'});
  // print(replaceEach); // ABCtext123textABC

  final toShortcodes = '😀text🤦🏾‍♀️'.emojis.toShortcodes();
  // print(toShortcodes); // :grinning_face:text:woman_facepalming_medium_dark_skin_tone:

  final toCLDRShortcodes = '😀text🤦🏾‍♀️'.emojis.toCLDRShortcodes();
  // print(toCLDRShortcodes); // :grinning_face:text:woman_facepalming_tone4:

  final toDiscordShortcodes = '😀text🤦🏾‍♀️'.emojis.toDiscordShortcodes();
  // print(toDiscordShortcodes); // :grinning:text:woman_facepalming_tone4:

  final toGithubShortcodes = '😀text🤦🏾‍♀️'.emojis.toGithubShortcodes();
  // print(toGithubShortcodes); // :grinning:text🤦🏾‍♀️

  final toSlackShortcodes = '😀text🤦🏾‍♀️'.emojis.toSlackShortcodes();
  // print(toSlackShortcodes); // :grinning:text:woman-facepalming::skin-tone-5:

  final fromShortcodes =
      'text:woman_facepalming_tone4:text'.emojis.fromShortcodes();
  // print(fromShortcodes); // text🤦🏾‍♀️text
}
