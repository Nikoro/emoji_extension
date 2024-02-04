<p align="center">
  <a href="https://pub.dev/packages/emoji_extension"><img src="https://raw.githubusercontent.com/nikoro/emoji_extension/main/logo/logo.png" width="600"/></a>
</p>
<h2 align="center">
Emojis for Dart <a href="https://www.unicode.org/reports/tr51/">Unicode 15.0</a><br>
+<br>
One, yet powerful <a href="https://github.com/Nikoro/emoji_extension/blob/main/lib/emoji_extension.dart">emojis</a> String extension
</h2>
<p align="center">
  <a href="https://pub.dev/packages/emoji_extension">
    <img alt="Pub Package" src="https://tinyurl.com/mvjwxt98">
  </a>
  <a href="https://github.com/Nikoro/emoji_extension/actions">
    <img alt="Build Status" src="https://github.com/Nikoro/emoji_extension/actions/workflows/build.yaml/badge.svg">
  </a>
  <a href="https://codecov.io/gh/Nikoro/emoji_extension">
    <img alt="Code Coverage" src="https://codecov.io/gh/Nikoro/emoji_extension/branch/main/graph/badge.svg">
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img alt="MIT License" src="https://tinyurl.com/3uf9tzpy">
  </a>
  <a href="https://www.unicode.org/reports/tr51/">
    <img alt="Unicode 15.0" src="https://img.shields.io/badge/unicode-15.0-5555FF?logo=unicode&logoColor=white">
  </a>
</p>

---
## Quick overview of just a few possibilities:
```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.extract; // [👍, 👍🏻, 👍🏼, 👍🏽, 👍🏾, 👍🏿]


'text😀 te😀xt 😀text'.emojis.remove; // text text text


// to Slack shortcodes:
'😀text🤦🏾‍♀️'.emojis.get.slackShortcodes; // [:grinning:, :woman-facepalming::skin-tone-5:]


// from Discord shortcodes:
'text:woman_facepalming_tone4:text'.emojis.fromShortcodes(); // text🤦🏾‍♀️text
```

## Usage

Import `import 'package:emoji_extension/emoji_extension.dart';` and you've got 2 benefits:

✅ [Emojis repository](#1%EF%B8%8F⃣-emojis-repository)
   - [get](#emojisget)
      - [values](#emojisgetvalues)
      - [unicodes](#emojisgetunicodes)
      - [names](#emojisgetnames)
      - [shortcodes](#emojisgetshortcodes)
   - [groups](#emojisgroups)
   - [subgroups](#emojissubgroups)
   - [groupsWithSubgroups](#emojisgroupswithsubgroups)
   - [shortcodePlatforms](#emojisshortcodeplatforms)
   - [getOne()](#emojisgetone)
   - [getOneOrNull()](#emojisgetoneornull)
   - [byGroup()](#emojisbygroup)
   - [bySubgroup()](#emojisbysubgroup)

✅ [Emojis extension](#2%EF%B8%8F⃣-emojis-extension)
   - [any](#emojisany)
   - [only](#emojisonly)
   - [onlyOne](#emojisonlyone)
   - [count](#emojiscount)
   - [remove](#emojisremove)
   - [split](#emojissplit)
   - [extract](#emojisextract)
   - [get](#emojisget-1)
      - [unicodes](#emojisgetunicodes-1)
      - [names](#emojisgetnames-1)
      - [shortcodes](#emojisgetshortcodes-1)
      - [groups](#emojisgetgroups)
      - [subgroups](#emojisgetsubgroups)
   - [hasAny()](#emojishasany)
   - [hasEach()](#emojishaseach)
   - [splitMapJoin()](#emojissplitmapjoin)
   - [replace()](#emojisreplace)
   - [replaceEach()](#emojisreplaceeach)
   - [toShortcodes()](#emojistoshortcodes)
   - [fromShortcodes()](#emojisfromshortcodes)

## 1️⃣ `Emojis()` repository
Full `Emojis()` repository with unicodes, names, groups, subgroups, shortcodes:

```dart
Emojis() // .get .groups .subgroups .groupsWithSubgroups .shortcodePlatforms   and many more...
```

### Emojis().get

```dart
Emojis().get; /* [
                  Emoji(
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
```

#### Emojis().get.values

```dart
Emojis().get.values; // [😀, 😃, 😄, 😁, 😆, 😅, 🤣, 😂, 🙂, 🙃, 🫠, 😉, 😊, 😇, 🥰, 😍, ...]
```

#### Emojis().get.unicodes

```dart
Emojis().get.unicodes; // [1F600, 1F603, 1F604, 1F601, 1F606, 1F605, 1F923, 1F602, 1F642, ...]
```

#### Emojis().get.names

```dart
Emojis().get.names; // [Grinning face, Grinning face with big eyes, ...]
```

#### Emojis().get.shortcodes

```dart
// Default (emoji name in snake_case)
Emojis().get.shortcodes; // [:grinning_face:, :grinning_face_with_big_eyes:, ...]

// CLDR
Emojis().get.cldrShortcodes; // [:grinning_face:, :grinning_face_with_big_eyes:, ...]

// Discord
Emojis().get.discordShortcodes; // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]

// Github (no skin-tone shortcodes)
Emojis().get.githubShortcodes; // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]

// Slack
Emojis().get.slackShortcodes; // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]
```

### Emojis().groups

```dart
Emojis().groups; // [Group.smileysAndEmotion, Group.peopleAndBody, Group.component, ...]
Emojis().groups.values; // [Smileys & Emotion, People & Body, Component, Animals & Nature, ...]
```

### Emojis().subgroups

```dart
Emojis().subgroups; // [Subgroup.faceSmiling, Subgroup.faceAffection, Subgroup.faceTongue, ...]
Emojis().subgroups.values; // face-smiling, face-affection, face-tongue, face-hand, ...]
```

### Emojis().groupsWithSubgroups

```dart
Emojis().groupsWithSubgroups; // {Group.smileysAndEmotion: [Subgroup.faceSmiling, ...], ...}
Emojis().groupsWithSubgroupsValues; // {Smileys & Emotion: [face-smiling, ...], ...}
```

### Emojis().shortcodePlatforms

```dart
Emojis().shortcodePlatforms; // [Default, CLDR, Discord, Github, Slack]
```

### Emojis().getOne()

```dart
// By value
Emojis().getOne('😀'); // or

// By unicode
Emojis().getOne('1F600'); // or

// By name (ignore-case)
Emojis().getOne('Grinning Face'); // or
Emojis().getOne('grinning face'); // or

// By shortcode (ignore-colons)
Emojis().getOne(':grinning:'); // or
Emojis().getOne('grinning'); // or
Emojis().getOne('grinning_face'); /* [Emoji(
                                         value: 😀,
                                         unicode: 1F600,
                                         name: Grinning face,
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
```

### Emojis().getOneOrNull()

Equivalent of [getOne()](#emojisgetone) with null safety:

```dart
Emojis().getOneOrNull('😀')?.name; // Grinning face
Emojis().getOneOrNull('some broken value')?.name; // null
```

### Emojis().byGroup()

```dart
Emojis().byGroup(Group.smileysAndEmotion); // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]

//or use convenient getters:
Emojis().smileysAndEmotion; // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]
```

### Emojis().bySubgroup()

```dart
Emojis().bySubgroup(Subgroup.faceSmiling); // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]

//or use convenient getters:
Emojis().faceSmiling; // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]
```

## 2️⃣ `emojis` extension
Simple `emojis` extension that you can use to manipulate emojis on any text:

```dart
'😀 text with emojis 😀'.emojis // .any .only .count .remove .get .extract   and many more...
```

### emojis.any

```dart
'😀text😀'.emojis.any; // true
'text'.emojis.any; // false
```

### emojis.only

```dart
'😀'.emojis.only; // true
'😀 😀 😀'.emojis.only; // true
'text 😀 😀 😀 text'.emojis.only; // false
'text'.emojis.only; // false
```

### emojis.onlyOne

```dart
'😀'.emojis.onlyOne; // true
'😀 😀 😀'.emojis.onlyOne; // false
'text 😀 😀 😀 text'.emojis.onlyOne; // false
'text'.emojis.onlyOne; // false
```

### emojis.count

```dart
'text 😀 😀 😀 text'.emojis.count; // 3
```

### emojis.remove

```dart
'text😀 te😀xt 😀text'.emojis.remove; // text text text
```

### emojis.split

```dart
'text😀text'.emojis.split; // [text, text]
```

### emojis.extract

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.extract; // [👍, 👍🏻, 👍🏼, 👍🏽, 👍🏾, 👍🏿]
```

### emojis.get

```dart
'😀text'.emojis.get; /* [Emoji(
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
```

#### emojis.get.unicodes

```dart
'😀text'.emojis.get.unicodes; // [1F600]
```

#### emojis.get.names

```dart
'😀text'.emojis.get.names; // [Grinning Face]
```

#### emojis.get.shortcodes

```dart
// Default (emoji name in snake_case)
'😀text🤦🏾‍♀️'.emojis.get.shortcodes; // [:grinning_face:, :woman_facepalming_medium_dark_skin_tone:]

// CLDR
'😀text🤦🏾‍♀️'.emojis.get.cldrShortcodes; // [:grinning_face:, :woman_facepalming_tone4:]

// Discord
'😀text🤦🏾‍♀️'.emojis.get.discordShortcodes; // [:grinning:, :woman_facepalming_tone4:]

// Github (no skin-tone shortcodes)
'😀text🤦🏾‍♀️'.emojis.get.githubShortcodes; // [:grinning:]

// Slack
'😀text🤦🏾‍♀️'.emojis.get.slackShortcodes; // [:grinning:, :woman-facepalming::skin-tone-5:]
```

#### emojis.get.groups

```dart
'😀text'.emojis.get.groups; // [Group.smileysAndEmotion]
'😀text'.emojis.get.groups.values; // [Smileys & Emotion]
```

#### emojis.get.subgroups

```dart
'😀text'.emojis.get.subgroups; // [Subgroup.faceSmiling]
'😀text'.emojis.get.subgroups.values; // [face-smiling]
```

### emojis.hasAny()

```dart
'👍️text'.emojis.hasAny(['👍']); // true
'😀text'.emojis.hasAny(['👍', '😀']); // true
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.hasAny(['😀']); // false
```

### emojis.hasEach()

```dart
'👍️text'.emojis.hasEach(['👍']); // true
'😀text👍'.emojis.hasEach(['👍', '😀']); // true
'😀text'.emojis.hasEach(['👍', '😀']); // false
```

### emojis.splitMapJoin()

```dart
'text😀text'.emojis.splitMapJoin( // TEXT_emoji_TEXT
onMatch: (_) => '_emoji_',
onNonMatch: (s) => s.toUpperCase(),
);                                
```

### emojis.replace()

```dart
'😀text👍'.emojis.replace('_'); // _️text_
```

### emojis.replaceEach()

```dart
'😀text👍🏻text😀'.emojis.replaceEach({'😀': 'ABC', '👍🏻': '123'}); // ABCtext123textABC
```

### emojis.toShortcodes()

```dart
// Default (emoji name in snake_case)
'😀text🤦🏾‍♀️'.emojis.toShortcodes(); // :grinning_face:text:woman_facepalming_medium_dark_skin_tone:

// CLDR
'😀text🤦🏾‍♀️'.emojis.toCLDRShortcodes(); // :grinning_face:text:woman_facepalming_tone4:

// Discord
'😀text🤦🏾‍♀️'.emojis.toDiscordShortcodes(); // :grinning:text:woman_facepalming_tone4:

// Github (no skin-tone shortcodes)
'😀text🤦🏾‍♀️'.emojis.toGithubShortcodes(); // :grinning:text🤦🏾‍♀️

// Slack
'😀text🤦🏾‍♀️'.emojis.toSlackShortcodes(); // :grinning:text:woman-facepalming::skin-tone-5:
```

### emojis.fromShortcodes()

```dart
// Default 
'text:woman_facepalming_medium_dark_skin_tone:text'.emojis.fromShortcodes(); // text🤦🏾‍♀️text

// CLDR or Discord
'text:woman_facepalming_tone4:text'.emojis.fromShortcodes(); // text🤦🏾‍♀️text

// Slack
'text:woman-facepalming::skin-tone-5:text'.emojis.fromShortcodes(); // text🤦🏾‍♀️text
```
