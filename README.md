<p align="center">
  <a href="https://pub.dev/packages/emoji_extension"><img src="https://raw.githubusercontent.com/nikoro/emoji_extension/main/logo/logo.png" width="600"/></a>
</p>
<h2 align="center">
Emojis for Dart <a href="https://www.unicode.org/reports/tr51/">Unicode 15.1</a><br>
+<br>
One, yet powerful <a href="#emojis-extension">emojis</a> String extension
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
    <img alt="Unicode 15.1" src="https://img.shields.io/badge/unicode-15.1-5555FF?logo=unicode&logoColor=white">
  </a>
</p>

---
## Features

- Contains over **5,000** emojis from Unicode 15.1 💪
- Supports:
  - `shorcodes`: **Discord**, **Github**, **Slack** 🫡
  - skin tone variations: 👍 👍🏻 👍🏼 👍🏽 👍🏾 👍🏿
  - hair style variations: 🦰 🦱 🦳 🦲
  - multi-person: 👨‍👩‍👧‍👦
- Provides [`Emojis()`](#emojis-repository) class that has all the info about each emoji:
  - value: 😀
  - unicode: 1F600
  - name: Grinning Face
  - apple name: Grinning Face
  - also known as: Happy Face, Smiley Face
  - group: Smileys & Emotion
  - subgroup: face-smiling
  - version: 8.0
  - status: fully-qualified
  - shortcodes:
    - Discord: grinning
    - Github: grinning
    - Slack: grinning
- Provides [`emojis`](#emojis-extension) extension to manipulate emojis on any text. Quick overview of just a few possibilities:

```dart
'text😀text🤦🏾‍♀️text'.emojis 
                         .contains // true
                         .only // false
                         .onlyOne // false
                         .count // 2
                         .split // [text, text, text]
                         .remove // texttexttext
                         .replace('-') // text-text-text
                         .extract // [😀, 🤦🏾‍♀️]
                         .get
                             .unicodes // [1F600, 1F926 1F3FE 200D 2640 FE0F]
                             .names // [Grinning Face, Woman Facepalming: Medium-Dark Skin Tone]
                             .slackShortcodes // [:grinning:, :woman-facepalming::skin-tone-5:]
                         ... // and many more
                          
// to Slack shortcodes:
'😀text🤦🏾‍♀️'.emojis.toSlackShortcodes(); // :grinning:text:woman-facepalming::skin-tone-5:

// from Slack shortcodes:
':grinning:text:woman-facepalming::skin-tone-5:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️
```

## Usage

Import `import 'package:emoji_extension/emoji_extension.dart';` and you've got 2 benefits:

<table align="center" style="width: 100%;">
  <tr>
    <td style="width: 50%;" valign="top">
      <h3 align="center">1️⃣ <a href="#emojis-repository">Emojis repository</a></h3>
      <p>______________________________________________</p>  
      <ul>
        <li><a href="#emojisget">get</a></li>
        <ul>
          <li><a href="#emojisgetvalues">values</a></li>
          <li><a href="#emojisgetunicodes">unicodes</a></li>
          <li><a href="#emojisgetnames">names</a></li>
          <li><a href="#emojisgetapplenames">appleNames</a></li>
          <li><a href="#emojisgetalsoknownas">alsoKnownAs</a></li>
          <li><a href="#emojisgetshortcodes">shortcodes</a></li>
        </ul>
        <li><a href="#emojisgroups">groups</a></li>
        <li><a href="#emojissubgroups">subgroups</a></li>
        <li><a href="#emojisgroupswithsubgroups">groupsWithSubgroups</a></li>
        <li><a href="#emojisshortcodeplatforms">shortcodePlatforms</a></li>
        <li><a href="#emojisversions">versions</a></li>
        <li><a href="#emojisstatuses">statuses</a></li>
        <li><a href="#emojisgetone">getOne()</a></li>
        <li><a href="#emojisgetoneornull">getOneOrNull()</a></li>
        <li><a href="#emojisbygroup">byGroup()</a></li>
        <li><a href="#emojisbysubgroup">bySubgroup()</a></li>
        <li><a href="#emojisbyversion">byVersion()</a></li>
        <li><a href="#emojisbystatus">byStatus()</a></li>
      </ul>
    </td>
    <td style="width: 50%;" valign="top">
      <h3 align="center">2️⃣ <a href="#emojis-extension">Emojis extension</a></h3>
      <p>______________________________________________</p>  
      <ul>
        <li><a href="#emojiscontains">contains</a></li>
        <li><a href="#emojisonly">only</a></li>
        <li><a href="#emojisonlyone">onlyOne</a></li>
        <li><a href="#emojiscount">count</a></li>
        <li><a href="#emojisremove">remove</a></li>
        <li><a href="#emojisremovewhere">removeWhere()</a></li>
        <li><a href="#emojissplit">split</a></li>
        <li><a href="#emojissplitwhere">splitWhere()</a></li>
        <li><a href="#emojisextract">extract</a></li>
        <li><a href="#emojisget-1">get</a></li>
        <ul>
          <li><a href="#emojisgetunicodes-1">unicodes</a></li>
          <li><a href="#emojisgetnames-1">names</a></li>
          <li><a href="#emojisgetapplenames-1">appleNames</a></li>
          <li><a href="#emojisgetalsoknownas-1">alsoKnownAs</a></li>
          <li><a href="#emojisgetgroups">groups</a></li>
          <li><a href="#emojisgetsubgroups">subgroups</a></li>
          <li><a href="#emojisgetshortcodes-1">shortcodes</a></li>
        </ul>
        <li><a href="#emojisanyof">anyOf()</a></li>
        <li><a href="#emojiseveryof">everyOf()</a></li>
        <li><a href="#emojissplitmapjoin">splitMapJoin()</a></li>
        <li><a href="#emojiscountwhere">countWhere()</a></li>
        <li><a href="#emojisreplace">replace()</a></li>
        <li><a href="#emojisreplacewith">replaceWith()</a></li>
        <li><a href="#emojisreplacewhere">replaceWhere()</a></li>
        <li><a href="#emojistoshortcodes">toShortcodes()</a></li>
        <li><a href="#emojisfromshortcodes">fromShortcodes()</a></li>
      </ul>
    </td>
  </tr>
</table>

## `Emojis()` repository
Full `Emojis()` repository with unicodes, names, apple names, "also known as", groups, subgroups, shortcodes:

```dart
Emojis()
        .get // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]
            .values // [😀, 😃, 😄, 😁, 😆, 😅, 🤣, 😂, 🙂, 🙃, 🫠, 😉, 😊, 😇, 🥰, 😍, ...]
            .unicodes // [1F600, 1F603, 1F604, 1F601, 1F606, 1F605, 1F923, 1F602, 1F642, ...]
            .names // [Grinning Face, Grinning Face with Big Eyes, ...]
            .appleNames // [Grinning Face, Grinning Face with Big Eyes, ...]
            .alsoKnownAs // [Happy Face, Smiley Face, Grinning Face, ...]
            .shortcodes // [:grinning_face:, :grinning_face_with_big_eyes:, ...]
        .groups // [Group.smileysAndEmotion, Group.peopleAndBody, Group.component, ...]
               .values // [Smileys & Emotion, People & Body, Component, Animals & Nature, ...]
        .subgroups // [Subgroup.faceSmiling, Subgroup.faceAffection, Subgroup.faceTongue, ...]
                  .values // [face-smiling, face-affection, face-tongue, face-hand, ...]
        .groupsWithSubgroups // {Group.smileysAndEmotion: [Subgroup.faceSmiling, ...], ...}
                            .values // {Smileys & Emotion: [face-smiling, ...], ...}
        .shortcodePlatforms // [Default, CLDR, Discord, Github, Slack]
        .versions // [Version.v6_0, Version.v7_0, Version.v8_0, Version.v9_0, ...]
                 .values // [6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 12.1, 13.0, ...]
        .statuses // [Status.fullyQualified, Status.minimallyQualified, ...]
                 .values // [fully-qualified, minimally-qualified, unqualified, ...]
```

### Emojis().get

```dart
Emojis().get; /* [
                  Emoji(
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
                   appleName: Grinning Face with Big Eyes,
                   alsoKnownAs: [Grinning Face, Happy Face, Happy, Smiley Face]
                   group: Smileys & Emotion,
                   subgroup: face-smiling,
                   version: 6.0,
                   status: fully-qualified
                   shortcodes: [...]
                  )
                 ...
                 ] */
```

#### Emojis().get.values

```dart
Emojis().get.values // [😀, 😃, 😄, 😁, 😆, 😅, 🤣, 😂, 🙂, 🙃, 🫠, 😉, 😊, 😇, 🥰, 😍, ...]
                   .first // 😀
                   .second // 😃
                   .third // 😄
                   .fourth // 😁
                   .fifth // 😆
                   .sixth // 😅
                   .penultimate // 🏴󠁧󠁢󠁳󠁣󠁴󠁿
                   .last // 🏴󠁧󠁢󠁷󠁬󠁳󠁿
```

#### Emojis().get.unicodes

```dart
Emojis().get.unicodes // [1F600, 1F603, 1F604, 1F601, 1F606, 1F605, 1F923, 1F602, 1F642, ...]
                     .first // 1F600
                     .second // 1F603
                     .third // 1F604
                     .fourth // 1F601
                     .fifth // 1F606
                     .sixth // 1F605
                     .penultimate // 1F3F4 E0067 E0062 E0073 E0063 E0074 E007F
                     .last // 1F3F4 E0067 E0062 E0077 E006C E0073 E007F
```

#### Emojis().get.names

```dart
Emojis().get.names // [Grinning Face, Grinning Face with Big Eyes, ...]
                  .first // Grinning Face
                  .second // Grinning Face with Big Eyes
                  .third // Grinning Face with Smiling Eyes
                  .fourth // Beaming Face with Smiling Eyes
                  .fifth // Grinning Squinting Face
                  .sixth // Grinning Face with Sweat
                  .penultimate // Flag: Scotland
                  .last // Flag: Wales
```

#### Emojis().get.appleNames

```dart
Emojis().get.appleNames // [Grinning Face, Grinning Face with Big Eyes, ...]
                       .first // Grinning Face
                       .second // Grinning Face with Big Eyes
                       .third // Grinning Face with Smiling Eyes
                       .fourth // Beaming Face with Smiling Eyes
                       .fifth // Grinning Face with Squinting Eyes
                       .sixth // Grinning Face with Sweat
                       .penultimate // Flag of Scotland
                       .last // Flag of Wales
```

#### Emojis().get.alsoKnownAs

```dart
Emojis().get.alsoKnownAs // [Happy Face, Smiley Face, Grinning Face, ...]
                        .first // Happy Face
                        .second // Smiley Face
                        .third // Grinning Face
                        .fourth // Happy Face
                        .fifth // Happy
                        .sixth // Smiley Face
                        .penultimate // Welsh Flag
                        .last // Y Ddraig Goch
```

#### Emojis().get.shortcodes

```dart
// Default (emoji name in snake_case)
Emojis().get.shortcodes // [:grinning_face:, :grinning_face_with_big_eyes:, ...]
                       .first // :grinning_face:
                       .second // :grinning_face_with_big_eyes:
                       .third // :grinning_face_with_smiling_eyes:
                       .fourth // :beaming_face_with_smiling_eyes:
                       .fifth // :grinning_squinting_face:
                       .sixth // :grinning_face_with_sweat:
                       .penultimate // :flag_scotland:
                       .last // :flag_wales:
```

#### Emojis().get.cldrShortcodes

```dart
// CLDR
Emojis().get.cldrShortcodes // [:grinning_face:, :grinning_face_with_big_eyes:, ...]
                           .first // :grinning_face:
                           .second // :grinning_face_with_big_eyes:
                           .third // :grinning_face_with_smiling_eyes:
                           .fourth // :beaming_face_with_smiling_eyes:
                           .fifth // :grinning_squinting_face:
                           .sixth // :grinning_face_with_sweat:
                           .penultimate // :flag_scotland:
                           .last // :flag_wales:
```

#### Emojis().get.discordShortcodes

```dart
// Discord
Emojis().get.discordShortcodes // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]
                              .first // :grinning:
                              .second // :smiley:
                              .third // :smile:
                              .fourth // :grin:
                              .fifth // :laughing:
                              .sixth // :sweat_smile:
                              .penultimate // :scotland:
                              .last // :wales:
```

#### Emojis().get.githubShortcodes

```dart
// Github (no skin-tone shortcodes)
Emojis().get.githubShortcodes // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]
                             .first // :grinning:
                             .second // :smiley:
                             .third // :smile:
                             .fourth // :grin:
                             .fifth // :laughing:
                             .sixth // :sweat_smile:
                             .penultimate // :scotland:
                             .last // :wales:
```

#### Emojis().get.slackShortcodes

```dart
// Slack
Emojis().get.slackShortcodes // [:grinning:, :smiley:, :smile:, :grin:, :laughing:, ...]
                            .first // :grinning:
                            .second // :smiley:
                            .third // :smile:
                            .fourth // :grin:
                            .fifth // :laughing:
                            .sixth // :sweat_smile:
                            .penultimate // :flag-scotland:
                            .last // :flag-wales:
```

### Emojis().groups

```dart
Emojis().groups // [Group.smileysAndEmotion, Group.peopleAndBody, Group.component, ...]
               .first // Group.smileysAndEmotion
               .second // Group.peopleAndBody
               .third // Group.component
               .fourth // Group.animalsAndNature
               .fifth // Group.foodAndDrink
               .sixth // Group.travelAndPlaces
               .penultimate // Group.symbols
               .last // Group.flags
               .values // [Smileys & Emotion, People & Body, Component, Animals & Nature, ...]
                      .first // Smileys & Emotion
                      .second // People & Body
                      .third // Component
                      .fourth // Animals & Nature
                      .fifth // Food & Drink
                      .sixth // Travel & Places
                      .penultimate // Symbols
                      .last // Flags
```

### Emojis().subgroups

```dart
Emojis().subgroups // [Subgroup.faceSmiling, Subgroup.faceAffection, Subgroup.faceTongue, ...]
                  .first // Subgroup.faceSmiling
                  .second // Subgroup.faceAffection
                  .third // Subgroup.faceTongue
                  .fourth // Subgroup.faceHand
                  .fifth // Subgroup.faceNeutralSkeptical
                  .sixth // Subgroup.faceSleepy
                  .penultimate // Subgroup.countryFlag
                  .last // Subgroup.subdivisionFlag
                  .values // [face-smiling, face-affection, face-tongue, face-hand, ...]
                         .first // face-smiling
                         .second // face-affection
                         .third // face-tongue
                         .fourth // face-hand
                         .fifth // face-neutral-skeptical
                         .sixth // face-sleepy
                         .penultimate // country-flag
                         .last // subdivision-flag
```

### Emojis().groupsWithSubgroups

```dart
Emojis().groupsWithSubgroups; // {Group.smileysAndEmotion: [Subgroup.faceSmiling, ...], ...}
Emojis().groupsWithSubgroupsValues; // {Smileys & Emotion: [face-smiling, ...], ...}
```

### Emojis().shortcodePlatforms

```dart
Emojis().shortcodePlatforms // [Default, CLDR, Discord, Github, Slack]
                           .first // Default
                           .second // CLDR
                           .third // Discord
                           .fourth // Github
                           .fifth // Slack
                           .sixthOrNull // null
                           .penultimate // Github
                           .last // Slack
```

### Emojis().versions

```dart
Emojis().versions // [Version.v6_0, Version.v7_0, Version.v8_0, Version.v9_0, ...]
                 .first // Version.v6_0
                 .second // Version.v7_0
                 .third // Version.v8_0
                 .fourth // Version.v9_0
                 .fifth // Version.v10_0
                 .sixth // Version.v11_0
                 .penultimate // Version.v15_0
                 .last // Version.v15_1
                 .values // [6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 12.1, 13.0, ...]
                        .first // 6.0
                        .second // 7.0
                        .third // 8.0
                        .fourth // 9.0
                        .fifth // 10.0
                        .sixth // 11.0
                        .penultimate // 15.0
                        .last // 15.1
```

### Emojis().statuses

```dart
Emojis().statuses // [Status.fullyQualified, Status.minimallyQualified, ...]
                 .first // Status.fullyQualified
                 .second // Status.minimallyQualified
                 .third // Status.unqualified
                 .fourth // Status.component
                 .fifthOrNull // null
                 .sixthOrNull // null
                 .penultimate // Status.unqualified
                 .last // Status.component
                 .values // [fully-qualified, minimally-qualified, unqualified, ...]
                        .first // fully-qualified
                        .second // minimally-qualified
                        .third // unqualified
                        .fourth // component
                        .fifthOrNull // null
                        .sixthOrNull // null
                        .penultimate // unqualified
                        .last // component
```

### Emojis().getOne()

```dart
// By value
Emojis().getOne('😀'); // or

// By unicode
Emojis().getOne('1F600'); // or

// By name or apple name (ignore-case)
Emojis().getOne('Grinning Face'); // or
Emojis().getOne('grinning face'); // or

// By also known as (ignore-case)
Emojis().getOne('Happy Face'); // or
Emojis().getOne('happy face'); // or
Emojis().getOne('Smiley Face'); // or
Emojis().getOne('smiley face'); // or

// By shortcode (ignore-colons)
Emojis().getOne(':grinning:'); // or
Emojis().getOne('grinning'); // or
Emojis().getOne('grinning_face'); /* [Emoji(
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
```

### Emojis().getOneOrNull()

Equivalent of [getOne()](#emojisgetone) with null safety:

```dart
Emojis().getOneOrNull('😀')?.name; // Grinning face
Emojis().getOneOrNull('some unknown value')?.name; // null
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

### Emojis().byVersion()

```dart
Emojis().byVersion(Version.v6_0); // [Emoji(value: 😃, ...), Emoji(value: 😄, ...), ...]

//or use convenient getters:
Emojis().v6_0; // [Emoji(value: 😃, ...), Emoji(value: 😄, ...), ...]
```

### Emojis().byStatus()

```dart
Emojis().byStatus(Status.fullyQualified); // [Emoji(value: 😃, ...), Emoji(value: 😄, ...), ...]

//or use convenient getters:
Emojis().fullyQualified; // [Emoji(value: 😃, ...), Emoji(value: 😄, ...), ...]
```

## `emojis` extension
Simple `emojis` extension that you can use to manipulate emojis on any text:

```dart
'text😀text🤦🏾‍♀️text'.emojis 
                         .contains // true
                         .only // false
                         .onlyOne // false
                         .count // 2
                         .split // [text, text, text]
                         .remove // texttexttext
                         .removeFirst // texttext🤦🏾‍♀️text
                         .removeSecond // text😀texttext
                         .removePenultimate // texttext🤦🏾‍♀️text
                         .removeLast // text😀texttext
                         .extract // [😀, 🤦🏾‍♀️]
                                 .first // 😀
                                 .second // 🤦🏾‍♀️
                                 .thirdOrNull // null
                                 .penultimate // 😀
                                 .last // 🤦🏾‍♀️
                         .anyOf(['😀', '👍🏻']) // true
                         .everyOf(['😀', '👍🏻']) // false
                         .countWhere((e) => e.value == '🤦🏾‍♀️') // 1
                         .removeAt(0) // texttext🤦🏾‍♀️text
                         .removeFromEnd(0) // text😀texttext
                         .removeWhere((e) => e.value == '🤦🏾‍♀️') // text😀texttext
                         .replace('-') // text-text-text
                         .replaceWith({'😀':'ABC' , '🤦🏾‍♀️':'123'}) // textABCtext123text
                         .replaceWhere((e) => e.value == '🤦🏾‍♀️' ? '123' : null) // text😀text123text
                         .splitWhere((e) => e.value == '😀'); // [text, text🤦🏾‍♀️text]
                         .splitMapJoin(
                                       onMatch: (_) => '_emoji_',
                                       onNonMatch: (s) => s.toUpperCase(),
                                      ) // TEXT_emoji_TEXT_emoji_TEXT
                         .get // [Emoji(value: 😀, ...), Emoji(value: 🤦🏾‍♀️, ...)]
                             .values // [😀, 🤦🏾‍♀️]
                             .unicodes // [1F600, 1F926 1F3FE 200D 2640 FE0F]
                                      .first // 1F600
                                      .second // 1F926 1F3FE 200D 2640 FE0F
                             .names // [Grinning Face, Woman Facepalming: Medium-Dark Skin Tone]
                             .appleNames // [Grinning Face]
                             .alsoKnownAs // [Happy Face, Smiley Face]
                             .groups // [Group.smileysAndEmotion, Group.peopleAndBody]
                                    .values // [Smileys & Emotion, People & Body]
                             .subgroups // [Subgroup.faceSmiling, Subgroup.personGesture]
                                       .values // [face-smiling, person-gesture]
                             .shortcodes // [:grinning_face:, :woman_facepalming_medium_dark_skin_tone:]
                             .cldrShortcodes // [:grinning_face:, :woman_facepalming_tone4:]
                             .discordShortcodes // [:grinning:, :woman_facepalming_tone4:]
                             .githubShortcodes // [:grinning:]
                             .slackShortcodes // [:grinning:, :woman-facepalming::skin-tone-5:]
                         .first // Emoji(value: 😀, ...)
                             .value // 😀
                             .unicode // 1F600
                             .name // Grinning Face
                             .appleName // Grinning Face
                             .alsoKnownAs // [Happy Face, Smiley Face]
                             .group // Group.smileysAndEmotion
                                   .value // Smileys & Emotion
                             .subgroup // Subgroup.faceSmiling
                                      .value // face-smiling
                             .shortcode // :grinning_face:
                             .cldrShortcode // :grinning_face:
                             .discordShortcode // :grinning:
                             .githubShortcode // :grinning:
                             .slackShortcodes // :grinning:
```

### emojis.contains

```dart
'😀text🤦🏾‍♀️'.emojis.contains; // true
'text'.emojis.contains; // false
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
'😀text🤦🏾‍♀️'.emojis.count; // 2
```

### emojis.countWhere()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.countWhere((e) => e.value == '😀'); // 2
```

### emojis.remove

```dart
'te😀xt 🤦🏾‍♀️text'.emojis.remove; // text text
```

### emojis.removeWhere()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.removeWhere((e) => e.value == '😀'); // text🤦🏾‍♀️text
```

### emojis.split

```dart
'text😀text'.emojis.split; // [text, text]
```

### emojis.splitWhere()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.splitWhere((e) => e.value == '🤦🏾‍♀️'); // [😀text, text😀]
```

### emojis.extract

```dart
'👍️te👍🏻xt👍🏽te👍🏿xt'.emojis.extract // [👍, 👍🏻, 👍🏽, 👍🏿]
                                  .first // 👍
                                  .second // 👍🏻
                                  .third // 👍🏽
                                  .fourth // 👍🏿
                                  .fifthOrNull // null
                                  .sixthOrNull // null
                                  .penultimate // 👍🏽
                                  .last // 👍🏿
```

### emojis.get

```dart
'😀text'.emojis.get; /* [Emoji(
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
```

#### emojis.get.unicodes

```dart
'😀text🤦🏾‍♀️'.emojis.get.unicodes // [1F600, 1F926 1F3FE 200D 2640 FE0F]
                              .first // 1F600
                              .penultimate // 1F600
                              .second // 1F926 1F3FE 200D 2640 FE0F
                              .last // 1F926 1F3FE 200D 2640 FE0F
```

#### emojis.get.names

```dart
'😀text🤦🏾‍♀️'.emojis.get.names // [Grinning Face, Woman Facepalming: Medium-Dark Skin Tone]
                           .first // Grinning Face
                           .penultimate // Grinning Face
                           .second // Woman Facepalming: Medium-Dark Skin Tone
                           .last // Woman Facepalming: Medium-Dark Skin Tone
```

#### emojis.get.appleNames

```dart
'😀text🤦🏾‍♀️'.emojis.get.appleNames // [Grinning Face]
                                .first // Grinning Face
                                .penultimate // Grinning Face
                                .secondOrNull // null
                                .lastOrNull // null
```

#### emojis.get.alsoKnownAs

```dart
'😀text'.emojis.get.alsoKnownAs // [Happy Face, Smiley Face]
                               .first // Happy Face
                               .penultimate // Happy Face
                               .second // Smiley Face
                               .last // Smiley Face
```

#### emojis.get.groups

```dart
'😀text🤦🏾‍♀️'.emojis.get.groups // [Group.smileysAndEmotion, Group.peopleAndBody]
                            .first // Group.smileysAndEmotion
                            .penultimate // Group.smileysAndEmotion
                            .second // Group.peopleAndBody
                            .last // Group.peopleAndBody
                            .values // [Smileys & Emotion, People & Body]
                                   .first // Smileys & Emotion
                                   .penultimate // Smileys & Emotion
                                   .second // People & Body
                                   .last // People & Body 
```

#### emojis.get.subgroups

```dart
'😀text🤦🏾‍♀️'.emojis.get.subgroups // [Subgroup.faceSmiling, Subgroup.personGesture]
                               .first // Subgroup.faceSmiling
                               .penultimate // Subgroup.faceSmiling
                               .second // Subgroup.personGesture
                               .last // Subgroup.personGesture
                               .values // [face-smiling, person-gesture]
                                      .first // face-smiling
                                      .penultimate // face-smiling
                                      .second // person-gesture
                                      .last // person-gesture
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

### emojis.anyOf()

```dart
'😀text🤦🏾‍♀️'.emojis.anyOf(['😀']); // true
'😀text🤦🏾‍♀️'.emojis.anyOf(['😀', '👍🏻']); // true
'😀text🤦🏾‍♀️'.emojis.anyOf(['👍🏻']); // false
```

### emojis.everyOf()

```dart
'😀text🤦🏾‍♀️'.emojis.everyOf(['😀']); // true
'😀text🤦🏾‍♀️'.emojis.everyOf(['😀', '🤦🏾‍♀️']); // true
'😀text🤦🏾‍♀️'.emojis.everyOf(['😀', '🤦🏾‍♀️', '👍🏻']); // false
```

### emojis.splitMapJoin()

```dart
'😀text🤦🏾‍♀️'.emojis.splitMapJoin(
onMatch: (_) => '_emoji_',
onNonMatch: (s) => s.toUpperCase(),
); // _emoji_TEXT_emoji_                                
```

### emojis.replace()

```dart
'😀text🤦🏾‍♀️'.emojis.replace('_'); // _️text_
```

### emojis.replaceWith()

```dart
'😀text🤦🏾‍♀️'.emojis.replaceWith({'😀':'ABC', '🤦🏾‍♀️':'123'}); // ABCtext123
```

### emojis.replaceWhere()

```dart
'😀text🤦🏾‍♀️'.emojis.replaceWhere((e) => e.value == '🤦🏾‍♀️' ? '123' : null); // 😀text123

'😀text🤦🏾‍♀️'.emojis.replaceWhere((e) => {'😀':'ABC', '🤦🏾‍♀️':'123'}[e.value]); // ABCtext123
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
':grinning_face:text:woman_facepalming_medium_dark_skin_tone:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️

// CLDR
':grinning_face:text:woman_facepalming_tone4:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️

// Discord
':grinning:text:woman_facepalming_tone4:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️

// Github (no skin-tone shortcodes)
':grinning:text:woman_facepalming:'.emojis.fromShortcodes(); // 😀text🤦‍♀

// Slack
':grinning:text:woman-facepalming::skin-tone-5:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️
```
