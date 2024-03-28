## 0.3.0

- Updated emoji dataset to newest [Unicode 15.1](https://www.unicode.org/reports/tr51/)
- Extended data about emoji including:
  - apple name      
  - also known as   
  - version         
  - status          

Example:
```
Emoji(
  value: 😆,
  unicode: 1F606,
  name: Grinning Squinting Face,
  appleName: Grinning Face with Squinting Eyes,
  alsoKnownAs: [><, Closed-Eyes Smile, Big Grin, Laughing, XD],
  group: Smileys & Emotion,
  subgroup: face-smiling,
  version: 6.0,
  status: fully-qualified,
  shortcodes: [
    Shortcode(
    platform: Default,
    values: [grinning_squinting_face]
  ), 
    Shortcode(
    platform: CLDR,
    values: [grinning_squinting_face]
  ), 
    Shortcode(
    platform: Discord,
    values: [laughing, satisfied]
  ), 
    Shortcode(
    platform: Github,
    values: [laughing, satisfied]
  ), 
    Shortcode(
    platform: Slack,
    values: [laughing, satisfied]
  )]
)
```
- Added `replaceWhere` method:
```dart
'😀_text_👍🏻'.emojis.replaceWhere((e) => e.value == '👍🏻' ? 'OK' : null); // 😀_text_OK

'😀_text_👍🏻'.emojis.replaceWhere((e) => {'😀':'ABC', '👍🏻':'123'}[e.value]); // ABC_text_123
```
> **Warning**
>
> Deprecated `any` getter -> use `contains` instead
>
> Deprecated `replaceEach` method -> use `replaceWith` instead
>
> Deprecated `hasAny` method -> use `anyOf` instead
>
> Deprecated `hasEach` method -> use `everyOf` instead

## 0.2.0

- Added optional fallback function `onUnknownShortcode` when parsing String with unknown shortcode:
```dart
const text = ':man: :this-shortcode-does-not-exist: :woman:';
final result = text.fromShortcodes(onUnknownShortcode: (_) => '🤷');
print(result); // '👨 🤷 👩'
```
- Added support for parsing chained emojis:
```dart
const text = ':otter::woman-facepalming::skin-tone-5::santa::dancer::skin-tone-4::female-astronaut::skin-tone-5:';
final result = text.fromShortcodes();
print(result); // '🦦🤦🏾‍♀️🎅💃🏽👩🏾‍🚀'
```
- Improved [README](https://github.com/Nikoro/emoji_extension/blob/main/README.md)

## 0.1.3

- Updated description
- Updated [README](https://github.com/Nikoro/emoji_extension/blob/main/README.md)

## 0.1.2

- Updated dependencies
- Updated the SDK constraint to '>=2.18.6 <4.0.0'

## 0.1.1

- Formatted code
- Updated  description
- Updated lint rules
- Improved documentation
- Improved [README](https://github.com/Nikoro/emoji_extension/blob/main/README.md)

## 0.1.0

Initial release 🎉