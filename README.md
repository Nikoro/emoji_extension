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
- Provides [`Emojis`](#emojis-collection) class that has all the info about each emoji:
  - value: 😆
  - unicode: 1F606
  - name: Grinning Squinting Face
  - apple name: Grinning Face with Squinting Eyes
  - also known as: ><, Closed-Eyes Smile, Big Grin, Laughing, XD
  - group: Smileys & Emotion
  - subgroup: face-smiling
  - version: 6.0
  - status: fully-qualified
  - shortcodes:
    - CLDR: grinning_squinting_face
    - Discord: laughing, satisfied
    - Github: laughing, satisfied
    - Slack: laughing, satisfied
- Provides [`emojis`](#emojis-extension) extension to interact with emojis within any text. Quick overview of just a few possibilities:

```dart
'text😀text🤦🏾‍♀️text'.emojis 
                         .contains // true
                         .only // false
                         .onlyOne // false
                         .count // 2
                         .split // [text, text, text]
                         .remove // texttexttext
                         .extract // [😀, 🤦🏾‍♀️]
                         .replace('-') // text-text-text
                         .first
                               .value // 😀
                               .unicode // 1F600
                               .name // Grinning Face
                         ... // and many more
                          
// to Slack shortcodes:
'😀text🤦🏾‍♀️'.emojis.toSlackShortcodes(); // :grinning:text:woman-facepalming::skin-tone-5:

// from Slack shortcodes:
':grinning:text:woman-facepalming::skin-tone-5:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️
```

## Table of contents

Import `import 'package:emoji_extension/emoji_extension.dart';` and you've got 2 benefits:

<table align="center" style="width: 100%;">
  <tr>
    <td style="width: 50%;" valign="top">
      <h3 align="center">1️⃣ <a href="#emojis-collection">Emojis collection</a></h3>
      <p>______________________________________</p>  
      <ul>
        <li><a href="#emojisall">all</a></li>
        <ul>
          <li><a href="#emojisgetnames">names</a></li>
          <li><a href="#emojisgetapplenames">appleNames</a></li>
          <li><a href="#emojisgetalsoknownas">alsoKnownAs</a></li>
          <li><a href="#emojisgetshortcodes">shortcodes</a></li>
            <ul>
              <li><a href="#emojisgetcldrshortcodes">CLDR</a></li>
              <li><a href="#emojisgetdiscordshortcodes">Discord</a></li>
              <li><a href="#emojisgetgithubshortcodes">Github</a></li>
              <li><a href="#emojisgetslackshortcodes">Slack</a></li>
            </ul>
          <li><a href="#emojisgetunicodes">unicodes</a></li>
          <li><a href="#emojisgetvalues">values</a></li>
        </ul>
        <li><a href="#emojisgetone">getOne()</a></li>
        <li><a href="#emojisgetoneornull">getOneOrNull()</a></li>
        <li><a href="#emojisbygroup">byGroup()</a></li>
        <li><a href="#emojisbysubgroup">bySubgroup()</a></li>
        <li><a href="#emojisbyversion">byVersion()</a></li>
        <li><a href="#emojisbystatus">byStatus()</a></li>
        <li><a href="#emojisgroups">groups</a></li>
        <li><a href="#emojissubgroups">subgroups</a></li>
        <li><a href="#emojisgroupswithsubgroups">groupsWithSubgroups</a></li>
        <li><a href="#emojisshortcodeplatforms">shortcodePlatforms</a></li>
        <li><a href="#emojisstatuses">statuses</a></li>
        <li><a href="#emojisversions">versions</a></li>
      </ul>
    </td>
    <td style="width: 50%;" valign="top">
      <h3 align="center">2️⃣ <a href="#emojis-extension">Emojis extension</a></h3>
      <p>______________________________________________________</p>
      <table align="center">
        <tr>
          <td style="width: 50%;" valign="top">
            <ul>
              <li><a href="#emojiscontains">contains</a></li>
              <li><a href="#emojiscount">count</a></li>
              <li><a href="#emojisextract">extract</a></li>
              <li><a href="#emojisfirst">first</a></li>
              <li><a href="#emojisfirstornull">firstOrNull</a></li>
              <li><a href="#emojissecond">second</a></li>
              <li><a href="#emojissecondornull">secondOrNull</a></li>
              <li><a href="#emojisthird">third</a></li>
              <li><a href="#emojisthirdornull">thirdOrNull</a></li>
              <li><a href="#emojisfourth">fourth</a></li>
              <li><a href="#emojisfourthornull">fourthOrNull</a></li>
              <li><a href="#emojisfifth">fifth</a></li>
              <li><a href="#emojisfifthornull">fifthOrNull</a></li>
              <li><a href="#emojissixth">sixth</a></li>
              <li><a href="#emojissixthornull">sixthOrNull</a></li>
              <li><a href="#emojispenultimate">penultimate</a></li>
              <li><a href="#emojispenultimateornull">penultimateOrNull</a></li>
              <li><a href="#emojislast">last</a></li>
              <li><a href="#emojislastornull">lastOrNull</a></li>
              <li><a href="#emojisget-1">get</a></li>
              <ul>
                <li><a href="#emojisgetalsoknownas-1">alsoKnownAs</a></li>
                <li><a href="#emojisgetapplenames-1">appleNames</a></li>
                <li><a href="#emojisgetnames-1">names</a></li>
                <li><a href="#emojisgetgroups">groups</a></li>
                <li><a href="#emojisgetsubgroups">subgroups</a></li>
                <li><a href="#emojisgetshortcodes-1">shortcodes</a></li>
                <ul>
                  <li><a href="#emojisgetcldrshortcodes-1">CLDR</a></li>
                  <li><a href="#emojisgetdiscordshortcodes-1">Discord</a></li>
                  <li><a href="#emojisgetgithubshortcodes-1">Github</a></li>
                  <li><a href="#emojisgetslackshortcodes-1">Slack</a></li>
                </ul>
                <li><a href="#emojisgetunicodes-1">unicodes</a></li>
              </ul>
              <li><a href="#emojisonly">only</a></li>
              <li><a href="#emojisonlyone">onlyOne</a></li>
              <li><a href="#emojisremove">remove</a></li>
              <li><a href="#emojisremovefirst">removeFirst</a></li>
              <li><a href="#emojisremovesecond">removeSecond</a></li>
              <li><a href="#emojisremovethird">removeThird</a></li>
              <li><a href="#emojisremovefourth">removeFourth</a></li>
              <li><a href="#emojisremovefifth">removeFifth</a></li>
              <li><a href="#emojisremovesixth">removeSixth</a></li>
              <li><a href="#emojisremovepenultimate">removePenultimate</a></li>
              <li><a href="#emojisremovelast">removeLast</a></li>
              <li><a href="#emojissplit">split</a></li>
            </ul>
          </td>
          <td style="width: 50%;" valign="top">
            <ul>
              <li><a href="#emojisany">any()</a></li>
              <li><a href="#emojisanyof">anyOf()</a></li>
              <li><a href="#emojiscontainsof">containsOf()</a></li>
              <li><a href="#emojiscontainsexactlyof">containsExactlyOf()</a></li>
              <li><a href="#emojiscontainsone">containsOne()</a></li>
              <li><a href="#emojiscontainsoneof">containsOneOf()</a></li>
              <li><a href="#emojiscontainsexactlyone">containsExactlyOne()</a></li>
              <li><a href="#emojiscontainsexactlyoneof">containsExactlyOneOf()</a></li>
              <li><a href="#emojiscountwhere">countWhere()</a></li>
              <li><a href="#emojiscountwhereindexed">countWhereIndexed()</a></li>
              <li><a href="#emojisevery">every()</a></li>
              <li><a href="#emojiseveryof">everyOf()</a></li>
              <li><a href="#emojisfirstwhere">firstWhere()</a></li>
              <li><a href="#emojisfirstwhereindexed">firstWhereIndexed()</a></li>
              <li><a href="#emojisfirstwhereornull">firstWhereOrNull()</a></li>
              <li><a href="#emojisfirstwhereindexedornull">firstWhereIndexedOrNull()</a></li>
              <li><a href="#emojisfold">fold()</a></li>
              <li><a href="#emojisfoldindexed">foldIndexed()</a></li>
              <li><a href="#emojisforeach">forEach()</a></li>
              <li><a href="#emojisforeachindexed">forEachIndexed()</a></li>
              <li><a href="#emojisforeachwhile">forEachWhile()</a></li>
              <li><a href="#emojisforeachindexedwhile">forEachIndexedWhile()</a></li>
              <li><a href="#emojisjoin">join()</a></li>
              <li><a href="#emojismap">map()</a></li>
              <li><a href="#emojismapindexed">mapIndexed()</a></li>
              <li><a href="#emojisnone">none()</a></li>
              <li><a href="#emojisnoneof">noneOf()</a></li>
              <li><a href="#emojisremoveat">removeAt()</a></li>
              <li><a href="#emojisremovefromend">removeFromEnd()</a></li>
              <li><a href="#emojisremoveeveryof">removeEveryOf()</a></li>
              <li><a href="#emojisremovewhere">removeWhere()</a></li>
              <li><a href="#emojisremovewhereindexed">removeWhereIndexed()</a></li>
              <li><a href="#emojisreplace">replace()</a></li>
              <li><a href="#emojisreplacewith">replaceWith()</a></li>
              <li><a href="#emojisreplacewhere">replaceWhere()</a></li>
              <li><a href="#emojisreplacewhereindexed">replaceWhereIndexed()</a></li>
              <li><a href="#emojisskip">skip()</a></li>
              <li><a href="#emojisskiplast">skipLast()</a></li>
              <li><a href="#emojisskiwhile">skipWhile()</a></li>
              <li><a href="#emojissome">some()</a></li>
              <li><a href="#emojissomeof">someOf()</a></li>
              <li><a href="#emojissplitmapjoin">splitMapJoin()</a></li>
              <li><a href="#emojissplitwhere">splitWhere()</a></li>
              <li><a href="#emojissplitwhereindexed">splitWhereIndexed()</a></li>
              <li><a href="#emojistoshortcodes">toShortcodes()</a></li>
              <li><a href="#emojisfromshortcodes">fromShortcodes()</a></li>
              <li><a href="#emojislastwhere">lastWhere()</a></li>
              <li><a href="#emojislastwhereindexed">lastWhereIndexed()</a></li>
              <li><a href="#emojislastwhereornull">lastWhereOrNull()</a></li>
              <li><a href="#emojislastwhereindexedornull">lastWhereIndexedOrNull()</a></li>
              <li><a href="#emojistake">take()</a></li>
              <li><a href="#emojistakelast">takeLast()</a></li>
              <li><a href="#emojistakewhile">takeWhile()</a></li>
              <li><a href="#emojiswhere">where()</a></li>
              <li><a href="#emojiswhereindexed">whereIndexed()</a></li>
              <li><a href="#emojiswherenot">whereNot()</a></li>
              <li><a href="#emojiswherenotindexed">whereNotIndexed()</a></li>
            </ul>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

## `Emojis` collection
Full `Emojis` collection with unicodes, names, apple names, "also known as", groups, subgroups, shortcodes:

```dart
Emojis
      .all // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]
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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### Emojis.byGroup()
```dart
Emojis.byGroup(Group.smileysAndEmotion); // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]

//or use convenient getters:
Emojis.smileysAndEmotion; // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### Emojis().bySubgroup()

```dart
Emojis().bySubgroup(Subgroup.faceSmiling); // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]

//or use convenient getters:
Emojis().faceSmiling; // [Emoji(value: 😀, ...), Emoji(value: 😃, ...), ...]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### Emojis().byVersion()

```dart
Emojis().byVersion(Version.v6_0); // [Emoji(value: 😃, ...), Emoji(value: 😄, ...), ...]

//or use convenient getters:
Emojis().v6_0; // [Emoji(value: 😃, ...), Emoji(value: 😄, ...), ...]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### Emojis().byStatus()

```dart
Emojis().byStatus(Status.fullyQualified); // [Emoji(value: 😃, ...), Emoji(value: 😄, ...), ...]

//or use convenient getters:
Emojis().fullyQualified; // [Emoji(value: 😃, ...), Emoji(value: 😄, ...), ...]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### Emojis().getOneOrNull()

Equivalent of [getOne()](#emojisgetone) with null safety:

```dart
Emojis().getOneOrNull('😀')?.name; // Grinning face
Emojis().getOneOrNull('some unknown value')?.name; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### Emojis().groupsWithSubgroups

```dart
Emojis().groupsWithSubgroups; // {Group.smileysAndEmotion: [Subgroup.faceSmiling, ...], ...}
Emojis().groupsWithSubgroupsValues; // {Smileys & Emotion: [face-smiling, ...], ...}
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

## `emojis` extension
One `emojis` extension that you can use to interact with emojis within any text:

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
                         .any((e) => e.value == '😀') // true
                         // or
                         .some((e) => e.value == '😀') // true
                         .anyOf(['😀', '👍🏻']) // true
                         // or
                         .someOf(['😀', '👍🏻']) // true
                         .every((e) => e.value == '😀') // false
                         .everyOf(['😀', '👍🏻']) // false
                         // or
                         .containsOf(['😀', '👍🏻']) // false
                         .containsOne((e) => e.value == '😀') // true
                         .none((e) => e.value == '👍🏻') // true
                         .noneOf(['😀', '👍🏻']) // false
                         .countWhere((e) => e.value == '🤦🏾‍♀️') // 1
                         .removeAt(0) // texttext🤦🏾‍♀️text
                         .removeFromEnd(0) // text😀texttext
                         .removeEveryOf(['😀', '🤦🏾‍♀️']) // texttexttext
                         .removeWhere((e) => e.value == '🤦🏾‍♀️') // text😀texttext
                         .replace('-') // text-text-text
                         .replaceWith({'😀':'ABC' , '🤦🏾‍♀️':'123'}) // textABCtext123text
                         .replaceWhere((e) => e.value == '🤦🏾‍♀️' ? '123' : null) // text😀text123text
                         .splitWhere((e) => e.value == '😀'); // [text, text🤦🏾‍♀️text]
                         .splitMapJoin(
                                       onMatch: (_) => '_emoji_',
                                       onNonMatch: (s) => s.toUpperCase(),
                                      ) // TEXT_emoji_TEXT_emoji_TEXT
                         .forEach((e) => print(e.value)) // 😀 🤦🏾‍♀️
                         .map((e) => e.value) // [😀, 🤦🏾‍♀️]
                         .where((e) => e.value == '😀') // Emoji(value: 😀, ...)
                         .take(1) // [Emoji(value: 😀, ...)]
                         .takeLast(1) // [Emoji(value: 🤦🏾‍♀️, ...)]
                         .skip(1) // [Emoji(value: 🤦🏾‍♀️, ...)]
                         .skipLast(1) // [Emoji(value: 😀, ...)]
                         .join((e) => e.value, separator: '.', prefix: 'prefix', suffix: 'suffix') // prefix😀.🤦🏾‍♀️suffix
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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.contains

```dart
'😀text🤦🏾‍♀️'.emojis.contains; // true
'text'.emojis.contains; // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.count

```dart
'😀text🤦🏾‍♀️'.emojis.count; // 2
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.extract

```dart
'🔺️te🟡xt🟩te🔷xt'.emojis.extract // [🔺, 🟡, 🟩, 🔷]
                                  .first // 🔺
                                  .second // 🟡
                                  .third // 🟩
                                  .fourth // 🔷
                                  .fifthOrNull // null
                                  .sixthOrNull // null
                                  .penultimate // 🟩
                                  .last // 🔷
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.first

```dart
'🔴te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.first // Emoji(value: 🔴, ...)
                                        .value // 🔴
                                        .name // Red Circle
                                        ...
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.firstOrNull

```dart
'🔴te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.firstOrNull // Emoji(value: 🔴, ...)

'text'.emojis.firstOrNull; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.second

```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.second // Emoji(value: 🔴, ...)
                                         .value // 🔴
                                         .name // Red Circle
                                         ...
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.secondOrNull

```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.secondOrNull // Emoji(value: 🔴, ...)

'text'.emojis.secondOrNull; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.third

```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.third // Emoji(value: 🔴, ...)
                                        .value // 🔴
                                        .name // Red Circle
                                        ...
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.thirdOrNull

```dart
'👍️te👍🏻xt🔴te👍🏽xt👍🏾te👍🏿xt'.emojis.thirdOrNull // Emoji(value: 🔴, ...)

'text'.emojis.thirdOrNull; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.fourth

```dart
'👍️te👍🏻xt👍🏼te🔴xt👍🏾te👍🏿xt'.emojis.fourth // Emoji(value: 🔴, ...)
                                         .value // 🔴
                                         .name // Red Circle
                                         ...
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.fourthOrNull

```dart
'👍️te👍🏻xt👍🏼te🔴xt👍🏾te👍🏿xt'.emojis.fourthOrNull // Emoji(value: 🔴, ...)

'text'.emojis.fourthOrNull; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.fifth

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.fifth // Emoji(value: 🔴, ...)
                                        .value // 🔴
                                        .name // Red Circle
                                        ...
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.fifthOrNull

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.fifthOrNull // Emoji(value: 🔴, ...)

'text'.emojis.fifthOrNull; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.sixth

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.sixth // Emoji(value: 🔴, ...)
                                        .value // 🔴
                                        .name // Red Circle
                                        ...
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.sixthOrNull

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.sixthOrNull // Emoji(value: 🔴, ...)

'text'.emojis.sixthOrNull; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.penultimate

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.penultimate // Emoji(value: 🔴, ...)
                                              .value // 🔴
                                              .name // Red Circle
                                              ...
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.penultimateOrNull

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.penultimateOrNull // Emoji(value: 🔴, ...)

'text'.emojis.penultimateOrNull; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.last

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.last // Emoji(value: 🔴, ...)
                                       .value // 🔴
                                       .name // Red Circle
                                       ...
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.lastOrNull

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.lastOrNull // Emoji(value: 🔴, ...)

'text'.emojis.lastOrNull; // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.alsoKnownAs

```dart
'😀text'.emojis.get.alsoKnownAs // [Happy Face, Smiley Face]
                               .first // Happy Face
                               .penultimate // Happy Face
                               .second // Smiley Face
                               .last // Smiley Face
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.appleNames

```dart
'😀text🤦🏾‍♀️'.emojis.get.appleNames // [Grinning Face]
                                .first // Grinning Face
                                .penultimate // Grinning Face
                                .secondOrNull // null
                                .lastOrNull // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.names

```dart
'😀text🤦🏾‍♀️'.emojis.get.names // [Grinning Face, Woman Facepalming: Medium-Dark Skin Tone]
                           .first // Grinning Face
                           .penultimate // Grinning Face
                           .second // Woman Facepalming: Medium-Dark Skin Tone
                           .last // Woman Facepalming: Medium-Dark Skin Tone
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.shortcodes

```dart
// Default (emoji name in snake_case)
'😀text🤦🏾‍♀️'.emojis.get.shortcodes; // [:grinning_face:, :woman_facepalming_medium_dark_skin_tone:]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.cldrShortcodes

```dart
// CLDR
'😀text🤦🏾‍♀️'.emojis.get.cldrShortcodes; // [:grinning_face:, :woman_facepalming_tone4:]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.discordShortcodes

```dart
// Discord
'😀text🤦🏾‍♀️'.emojis.get.discordShortcodes; // [:grinning:, :woman_facepalming_tone4:]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.githubShortcodes

```dart
// Github (no skin-tone shortcodes)
'😀text🤦🏾‍♀️'.emojis.get.githubShortcodes; // [:grinning:]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.slackShortcodes

```dart
// Slack
'😀text🤦🏾‍♀️'.emojis.get.slackShortcodes; // [:grinning:, :woman-facepalming::skin-tone-5:]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

#### emojis.get.unicodes

```dart
'😀text🤦🏾‍♀️'.emojis.get.unicodes // [1F600, 1F926 1F3FE 200D 2640 FE0F]
                              .first // 1F600
                              .penultimate // 1F600
                              .second // 1F926 1F3FE 200D 2640 FE0F
                              .last // 1F926 1F3FE 200D 2640 FE0F
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.only

```dart
'😀'.emojis.only; // true
'😀 😀 😀'.emojis.only; // true
'text 😀 😀 😀 text'.emojis.only; // false
'text'.emojis.only; // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.onlyOne

```dart
'😀'.emojis.onlyOne; // true
'😀 😀 😀'.emojis.onlyOne; // false
'text 😀 😀 😀 text'.emojis.onlyOne; // false
'text'.emojis.onlyOne; // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.remove

```dart
'😀text 🤦🏾‍♀️'.emojis.remove; // text
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeFirst

```dart
'🔴te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.removeFirst; // te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeSecond

```dart
'👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt'.emojis.removeSecond; // 👍️text👍🏼te👍🏽xt👍🏾te👍🏿xt
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeThird

```dart
'👍️te👍🏻xt🔴te👍🏽xt👍🏾te👍🏿xt'.emojis.removeThird; // 👍️te👍🏻xtte👍🏽xt👍🏾te👍🏿xt
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeFourth

```dart
'👍️te👍🏻xt👍🏼te🔴xt👍🏾te👍🏿xt'.emojis.removeFourth; // 👍️te👍🏻xt👍🏼text👍🏾te👍🏿xt
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeFifth

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.removeFifth; // 👍️te👍🏻xt👍🏼te👍🏽xtte👍🏿xt
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeSixth

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.removeSixth; // 👍️te👍🏻xt👍🏼te👍🏽xt👍🏾text
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removePenultimate

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt'.emojis.removePenultimate; // 👍️te👍🏻xt👍🏼te👍🏽xtte👍🏿xt
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeLast

```dart
'👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt'.emojis.removeLast; // 👍️te👍🏻xt👍🏼te👍🏽xt👍🏾text
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.split

```dart
'text😀text'.emojis.split; // [text, text]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.any()

```dart
'😀text🤦🏾‍♀️'.emojis.any((e) => e.value == '😀'); // true
'😀text🤦🏾‍♀️'.emojis.any((e) => e.value == '👍🏻'); // false
```
> Same as: emojis.[some()](#emojissome)
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.anyOf()

```dart
'😀text🤦🏾‍♀️'.emojis.anyOf(['😀']); // true
'😀text🤦🏾‍♀️'.emojis.anyOf(['😀', '👍🏻']); // true
'😀text🤦🏾‍♀️'.emojis.anyOf(['👍🏻']); // false
```
> Same as: emojis.[someOf()](#emojissomeof)
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.containsOf()

```dart
'😀text🤦🏾‍♀️'.emojis.containsOf(['😀']); // true
'😀text🤦🏾‍♀️'.emojis.containsOf(['😀', '🤦🏾‍♀️']); // true
'😀text🤦🏾‍♀️'.emojis.containsOf(['😀', '👍🏻']); // false
'😀text🤦🏾‍♀️'.emojis.containsOf(['👍🏻']); // false
```
> Same as: emojis.[everyOf()](#emojiseveryof)
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.containsExactlyOf()

```dart
'😀text🤦🏾‍♀️'.emojis.containsExactlyOf(['😀']); // false
'😀text🤦🏾‍♀️'.emojis.containsExactlyOf(['😀', '🤦🏾‍♀️']); // true
'😀text🤦🏾‍♀️text😀'.emojis.containsExactlyOf(['😀', '🤦🏾‍♀️']); // true
'😀text🤦🏾‍♀️'.emojis.containsExactlyOf(['👍🏻']); // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.containsOne()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.containsOne((e) => e.value == '🤦🏾‍♀️'); // true
'😀text🤦🏾‍♀️text😀'.emojis.containsOne((e) => e.value == '👍🏻'); // false
'😀text🤦🏾‍♀️text😀'.emojis.containsOne((e) => e.value == '😀'); // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.containsOneOf()

```dart
'😀text🤦🏾‍♀️'.emojis.containsOneOf({'🤦🏾‍♀️'}); // true
'😀text🤦🏾‍♀️'.emojis.containsOneOf({'😀', '🤦🏾‍♀️'}); // true
'😀text🤦🏾‍♀️'.emojis.containsOneOf('😀', '🤦🏾‍♀️', '👍🏻'}); // false
'😀text🤦🏾‍♀️text😀'.emojis.containsOneOf({'😀'}); // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.containsExactlyOne()

```dart
'😀text'.emojis.containsExactlyOne((e) => e.value == '😀'); // true
'😀text🤦🏾‍♀️'.emojis.containsExactlyOne((e) => e.value == '😀'); // false
'text'.emojis.containsExactlyOne((e) => e.value == '😀'); // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.containsExactlyOneOf()

```dart
'😀text🤦🏾‍♀️'.emojis.containsExactlyOneOf({'😀', '🤦🏾‍♀️'}); // true
'😀text🤦🏾‍♀️text😀'.emojis.containsExactlyOneOf({'😀', '🤦🏾‍♀️'}); // false
'😀text🤦🏾‍♀️'.emojis.containsExactlyOneOf({'😀'}); // false
'😀text🤦🏾‍♀️'.emojis.containsExactlyOneOf({'😀', '👍🏻'}); // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.countWhere()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.countWhere((e) => e.value == '😀'); // 2
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.countWhereIndexed()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.countWhereIndexed((i, e) => i == 0 && e.value == '😀'); // 1
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.every()

```dart
'😀text😀'.emojis.every((e) => e.value == '😀'); // true
'😀text🤦🏾‍♀️'.emojis.every((e) => e.value == '😀'); // false
'😀text🤦🏾‍♀️'.emojis.every((e) => e.value == '👍🏻'); // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.everyOf()

```dart
'😀text🤦🏾‍♀️'.emojis.everyOf(['😀']); // true
'😀text🤦🏾‍♀️'.emojis.everyOf(['😀', '🤦🏾‍♀️']); // true
'😀text🤦🏾‍♀️'.emojis.everyOf(['😀', '👍🏻']); // false
'😀text🤦🏾‍♀️'.emojis.everyOf(['👍🏻']); // false
```
> Same as: emojis.[containsOf()](#emojiscontainsof)
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.firstWhere()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhere((e) => e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.firstWhereIndexed()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereIndexed((i, e) => i > 0 && e.name.contains('Woman')); // Emoji(value: 🤦🏻‍♀️, ...)
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.firstWhereOrNull()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereOrNull((e) => e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)

'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereOrNull((e) => e.value == '👍🏻'); // null
```

### emojis.firstWhereIndexedOrNull()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereIndexedOrNull((i, e) => i == 0 && e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)

'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.firstWhereIndexedOrNull((i, e) => i == 0 && e.value == '😀'); // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.fold()

```dart
'😀text🤦🏾‍♀️'.emojis.fold('start', (p, c) => p + c.value); // start😀🤦🏾‍♀️
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.foldIndexed()

```dart
'😀text🤦🏾‍♀️'.emojis.foldIndexed('start', (i, p ,c) => '$p${c.value}$i'); // start😀0🤦🏾‍♀️1
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.forEach()

```dart
'😀text🤦🏾‍♀️'.emojis.forEach((e) => print(e.value)); // 😀 🤦🏾‍♀️
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.forEachIndexed()

```dart
'😀text🤦🏾‍♀️'.emojis.forEachIndexed(i,e) => print('$i:${e.value}')); // 0:😀 1:🤦🏾‍♀️
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.forEachWhile()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.forEachWhile((e) {
                                          print(e.value);
                                          return e.value == '😀';
                                          }); // 😀 🤦🏾‍♀️
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.forEachIndexedWhile()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.forEachIndexedWhile((i, e) {
                                                    print('$i:${e.value}');
                                                    return e.value == '😀';
                                                    }); // 0:😀 1:🤦🏾‍♀️
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.join()

```dart
'😀text🤦🏾‍♀️'.emojis.join((e) => e.value, 
                              separator: '.', 
                              prefix: 'prefix', 
                              suffix: 'suffix'); // 'prefix😀.🤦🏾‍♀️suffix'
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.map()

```dart
'😀text🤦🏾‍♀️'.emojis.map((e) => 'Emoji: ${e.name}'); // [Emoji: Grinning Face, Emoji: Woman Facepalming: Medium-Dark Skin Tone]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.mapIndexed()

```dart
'😀text🤦🏾‍♀️'.emojis.mapIndexed((i, e) => '$i: ${e.name}'); // [0: Grinning Face, 1: Woman Facepalming: Medium-Dark Skin Tone]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.none()

```dart
'😀text🤦🏾‍♀️'.emojis.none((e) => e.value == '👍🏻'); // true
'😀text🤦🏾‍♀️'.emojis.none((e) => e.value == '😀'); // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.noneOf()

```dart
'😀text🤦🏾‍♀️'.emojis.noneOf(['👍🏻']); // true
'😀text🤦🏾‍♀️'.emojis.noneOf(['👍🏻', '🤦🏾‍♀️']); // false
'😀text🤦🏾‍♀️'.emojis.noneOf(['😀', '🤦🏾‍♀️']); // false
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeAt()

```dart
'😀text🤦🏾‍♀️'.emojis.removeAt(0); // text🤦🏾‍♀️
'😀text🤦🏾‍♀️'.emojis.removeAt(10); // 😀text🤦🏾‍♀️
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeFromEnd()

```dart
'😀text🤦🏾‍♀️'.emojis.removeFromEnd(0); // 😀text
'😀text🤦🏾‍♀️'.emojis.removeFromEnd(10); // 😀text🤦🏾‍♀️
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeEveryOf()

```dart
'😀text🤦🏾‍♀️text👍🏻text😀'.emojis.removeEveryOf(['😀', '👍🏻']); // text🤦🏾‍♀️texttext
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeWhere()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.removeWhere((e) => e.value == '😀'); // text🤦🏾‍♀️text
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.removeWhereIndexed()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.removeWhereIndexed((i, e) => i == 0 && e.value == '😀'); // text🤦🏾‍♀️text😀
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.replace()

```dart
'😀text🤦🏾‍♀️'.emojis.replace('_'); // _️text_
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.replaceWith()

```dart
'😀text🤦🏾‍♀️'.emojis.replaceWith({'😀':'ABC', '🤦🏾‍♀️':'123'}); // ABCtext123
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.replaceWhere()

```dart
'😀text🤦🏾‍♀️'.emojis.replaceWhere((e) => e.value == '🤦🏾‍♀️' ? '123' : null); // 😀text123

'😀text🤦🏾‍♀️'.emojis.replaceWhere((e) => {'😀':'ABC', '🤦🏾‍♀️':'123'}[e.value]); // ABCtext123
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.replaceWhereIndexed()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.replaceWhereIndexed((i, e) => i == 1 ? '_123_' : null); // 😀text_123_text😀
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.skip()

```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.skip(1); // [Emoji(value: 🤦🏾‍♀️, ...), Emoji(value: 👍🏻, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.skipLast()

```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.skipLast(1); // [Emoji(value: 😀, ...), Emoji(value: 🤦🏾‍♀️, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.skipWhile()

```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.skipWhile((e) => e.value == '😀'); // [Emoji(value: 🤦🏾‍♀️, ...), Emoji(value: 👍🏻, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.some()

```dart
'😀text🤦🏾‍♀️'.emojis.some((e) => e.value == '😀'); // true
'😀text🤦🏾‍♀️'.emojis.some((e) => e.value == '👍🏻'); // false
```
> Same as: emojis.[any()](#emojisany)
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.someOf()

```dart
'😀text🤦🏾‍♀️'.emojis.someOf(['😀']); // true
'😀text🤦🏾‍♀️'.emojis.someOf(['😀', '👍🏻']); // true
'😀text🤦🏾‍♀️'.emojis.someOf(['👍🏻']); // false
```
> Same as: emojis.[anyOf()](#emojisanyof)
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.splitMapJoin()

```dart
'😀text🤦🏾‍♀️'.emojis.splitMapJoin(
onMatch: (_) => '_emoji_',
onNonMatch: (s) => s.toUpperCase(),
); // _emoji_TEXT_emoji_                                
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.splitWhere()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.splitWhere((e) => e.value == '🤦🏾‍♀️'); // [😀text, text😀]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.splitWhereIndexed()

```dart
'😀text🤦🏾‍♀️text😀'.emojis.splitWhereIndexed((i, e) => i == 1 && e.value == '🤦🏾‍♀️'); // [😀text, text😀]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

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
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.lastWhere()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhere((e) => e.name.contains('Woman')); // Emoji(value: 🤦🏻‍♀️, ...)
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.lastWhereIndexed()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereIndexed((i, e) => i == 0 && e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.lastWhereOrNull()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereOrNull((e) => e.name.contains('Woman')); // Emoji(value: 🤦🏻‍♀️, ...)

'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereOrNull((e) => e.value == '👍🏻'); // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.lastWhereIndexedOrNull()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereIndexedOrNull((i, e) => i == 0 && e.name.contains('Woman')); // Emoji(value: 🤦🏾‍♀️, ...)

'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.lastWhereIndexedOrNull((i, e) => i == 0 && e.value == '😀'); // null
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.take()

```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.take(2); // [Emoji(value: 😀, ...), Emoji(value: 🤦🏾‍♀️, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.takeLast()

```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.takeLast(2); // [Emoji(value: 🤦🏾‍♀️, ...), Emoji(value: 👍🏻, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.takeWhile()

```dart
'😀text🤦🏾‍♀️text👍🏻'.emojis.takeWhile((e) => e.value == '😀'); // [Emoji(value: 😀, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.where()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.where((e) => e.name.contains('Woman')); // [Emoji(value: 🤦🏾‍♀️, ...), Emoji(value: 🤦🏻‍♀️, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.whereIndexed()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.whereIndexed((i, e) => i == 0 && e.name.contains('Woman')); // [Emoji(value: 🤦🏾‍♀️, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.whereNot()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.whereNot((e) => e.name.contains('Woman')); // [Emoji(value: 😀, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>

### emojis.whereNotIndexed()

```dart
'🤦🏾‍♀️text😀text🤦🏻‍♀️'.emojis.whereNotIndexed((i, e) => i == 0 && e.name.contains('Woman')); // [Emoji(value: 😀, ...), Emoji(value: 🤦🏻‍♀️, ...)]
```
<div align="center"><a href="#table-of-contents">↑ Table of contents ↑</a></div>
