import 'package:emoji_extension/emoji_extension.dart';

void main() {
  final emojis = Emojis().get;
  // print(emojis);
  /* Emoji(
                   value: 😀,
                   unicode: 1F600,
                   name: Grinning Face,
                   appleName: Grinning Face,
                   alsoKnownAs: [Happy Face, Smiley Face],
                   group: Smileys & Emotion,
                   subgroup: face-smiling,
                   version: 8.0,
                   status: fully-qualified,
                   shortcodes: [
                        Shortcode(
                        platform: Default,
                        values: [grinning_face]
                      ),
                        Shortcode(
                        platform: CLDR,
                        values: [grinning_face]
                      ),
                        Shortcode(
                        platform: Discord,
                        values: [grinning]
                      ),
                        Shortcode(
                        platform: Github,
                        values: [grinning]
                      ),
                        Shortcode(
                        platform: Slack,
                        values: [grinning]
                      )]
                  ),
                  Emoji(
                   value: 😃,
                   unicode: 1F603,
                   name: Grinning Face with Big Eyes,
                   appleName: Grinning Face with Big Eyes
                   alsoKnownAs: [Grinning Face, Happy Face, Happy, Smiley Face],
                   group: Smileys & Emotion,
                   subgroup: face-smiling,
                   version: 6.0,
                   status: fully-qualified
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

  final versions = Emojis().versions;
  // print(versions); // [Version.v6_0, Version.v7_0, Version.v8_0, Version.v9_0, ...]
  // print(versions.values); // [6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 12.1, 13.0, ...]

  final statuses = Emojis().statuses;
  // print(statuses); // [Status.fullyQualified, Status.minimallyQualified, ...]
  // print(statuses.values); // [fully-qualified, minimally-qualified, unqualified, ...]

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

  final nameOrNull = Emojis().getOneOrNull('some unknown value')?.name;
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
  // print(extract.first); // 👍
  // print(extract.second); // 👍🏻
  // print(extract.third); // 👍🏼
  // print(extract.fourth); // 👍🏽
  // print(extract.fifth); // 👍🏾
  // print(extract.sixth); // 👍🏿
  // print(extract.penultimate); // 👍🏾
  // print(extract.last); // 👍🏿

  final emoji = '😀text'.emojis.get;
  // print(emoji);
  /* [Emoji(
                          value: 😀,
                          unicode: 1F600,
                          name: Grinning Face,
                          appleName: Grinning Face,
                          alsoKnownAs: [Happy Face, Smiley Face],
                          group: Smileys & Emotion,
                          subgroup: face-smiling,
                          version: 8.0,
                          status: fully-qualified,
                          shortcodes: [
                            Shortcode(
                            platform: Default,
                            values: [grinning_face]
                          ),
                            Shortcode(
                            platform: CLDR,
                            values: [grinning_face]
                          ),
                            Shortcode(
                            platform: Discord,
                            values: [grinning]
                          ),
                            Shortcode(
                            platform: Github,
                            values: [grinning]
                          ),
                            Shortcode(
                            platform: Slack,
                            values: [grinning]
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

  final replaceWith =
      '😀text👍🏻text😀'.emojis.replaceWith({'😀': 'ABC', '👍🏻': '123'});
  // print(replaceWith); // ABCtext123textABC

  final replaceEach =
  '😀text👍🏻text😀'.emojis.replaceEach((e) => e == '👍🏻' ? '_OK_' : null);
  // print(replaceEach); // 😀text_OK_text😀

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
